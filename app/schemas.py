from pydantic import BaseModel
from typing import Optional

class ProdutoResponse(BaseModel):
    id: int
    nome: str
    categoria: str
    preco: float
    imagem: Optional[str] = None
    link: Optional[str] = None
    score_similaridade: float

class ProdutoVetorInput(BaseModel):
    id: int
    nome_produto: str
    categoria: str
    preco: float
    imagem: Optional[str] = None
    link: Optional[str] = None