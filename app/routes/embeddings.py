from fastapi import APIRouter, HTTPException, status, Depends
from app.schemas import ProdutoVetorInput
from app.dependencies import get_chroma_collection
from chromadb.api import Collection

router = APIRouter()

@router.post("/sincronizar", status_code=status.HTTP_201_CREATED)
def adicionar_produto_vetorial(
    produto: ProdutoVetorInput,
    collection: Collection = Depends(get_chroma_collection)
):
    """
    Sincroniza um produto com o banco vetorial ChromaDB usando o cliente nativo.
    """
    try:
        texto_semantico = (
            f"Produto: {produto.nomeProduto}. "
            f"Categoria: {produto.categoria}. "
            f"Faixa de preço: R$ {produto.preco:.2f}"
        )

        metadatas = {
            "original_id": produto.id,
            "categoria": produto.categoria,
            "empresa_id": 1,
            "preco": float(produto.preco)
        }

        collection.upsert( 
            ids=[str(produto.id)],
            documents=[texto_semantico],
            metadatas=[metadatas]
        )

        return {
            "message": f"Produto '{produto.nomeProduto}' sincronizado.",
            "id": produto.id
        }

    except Exception as e:
        print(f"Erro ao inserir no Chroma: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Erro ao processar embedding: {str(e)}"
        )