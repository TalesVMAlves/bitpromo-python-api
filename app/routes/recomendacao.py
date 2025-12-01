from typing import List
from fastapi import APIRouter, HTTPException, Query
from sqlalchemy import text
from app.dependencies import engine, get_chroma_collection
from app.schemas import ProdutoResponse

router = APIRouter()

@router.get("/buscar_semantica", response_model=List[ProdutoResponse])
def buscar_por_texto(
    q: str = Query(..., description="Texto da busca. Ex: 'Fogao 5 bocas.'"),
    limit: int = Query(5, description="Número máximo de recomendações"),
    min_score: float = Query(0.60, description="Limiar de semelhança (0.0 a 1.0)")
):
    """
    Busca produtos que tenham SENTIDO similar ao texto digitado (Busca Semântica).
    O ChromaDB gera o embedding do texto automaticamente.
    """
    collection = get_chroma_collection()
    
    results = collection.query(
        query_texts=[q],
        n_results=limit
    )

    ids_encontrados = []
    scores_map = {}

    if results['ids'] and results['distances']:
        found_ids = results['ids'][0]
        found_distances = results['distances'][0]

        for id_str, distancia in zip(found_ids, found_distances):
            similaridade = 1 - distancia
            
            if similaridade >= min_score:
                ids_encontrados.append(id_str)
                scores_map[id_str] = similaridade

    if not ids_encontrados:
        return []

    return _buscar_detalhes_sql(ids_encontrados, scores_map)


@router.get("/{produto_id}", response_model=List[ProdutoResponse])
def recomendar_por_id(
    produto_id: int,
    limit: int = Query(5, description="Número máximo de recomendações"),
    min_score: float = Query(0.70, description="Limiar de semelhança (0.0 a 1.0)")
):
    """
    Recomenda produtos similares com base em um Produto ID já existente.
    """
    collection = get_chroma_collection()

    target = collection.get(
        ids=[str(produto_id)],
        include=["embeddings"]
    )

    if not target['ids']:
        raise HTTPException(status_code=404, detail="Produto não encontrado no índice vetorial.")

    target_embedding = target['embeddings'][0]

    results = collection.query(
        query_embeddings=[target_embedding],
        n_results=limit + 1, 
        include=["distances"]
    )

    ids_encontrados = []
    scores_map = {}

    if results['ids'] and results['distances']:
        found_ids = results['ids'][0]
        found_distances = results['distances'][0]

        for id_str, distancia in zip(found_ids, found_distances):
            if id_str == str(produto_id):
                continue

            similaridade = 1 - distancia
            
            if similaridade >= min_score:
                ids_encontrados.append(id_str)
                scores_map[id_str] = similaridade

    if not ids_encontrados:
        return []

    return _buscar_detalhes_sql(ids_encontrados, scores_map)


def _buscar_detalhes_sql(ids_lista: List[str], scores_map: dict) -> List[ProdutoResponse]:
    """
    Função auxiliar (privada) para ir ao MySQL buscar os detalhes 
    dos IDs retornados pelo ChromaDB.
    """
    if not ids_lista:
        return []

    ids_formatados = ",".join(ids_lista)
    query_sql = text(f"SELECT * FROM produtos WHERE id IN ({ids_formatados})")

    with engine.connect() as conn:
        result_proxy = conn.execute(query_sql)
        produtos_db = result_proxy.mappings().all()

    response_list = []
    
    for prod in produtos_db:
        sim_score = scores_map[str(prod['id'])]
        
        response_list.append(ProdutoResponse(
            id=prod['id'],
            nome=prod['nome_produto'],
            categoria=prod['categoria'],
            preco=float(prod['preco']),
            imagem=prod['imagem'],
            link=prod['link'],
            score_similaridade=round(sim_score, 4)
        ))

    response_list.sort(key=lambda x: x.score_similaridade, reverse=True)

    return response_list