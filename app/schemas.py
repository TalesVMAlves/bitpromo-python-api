from pydantic import BaseModel
from typing import Optional

class ProdutoResponse(BaseModel):
    id: int
    nomeProduto: str
    categoria: str
    preco: float
    imagem: Optional[str] = None
    link: Optional[str] = None
    scoreSimilaridade: float

class ProdutoVetorInput(BaseModel):
    id: int
    nomeProduto: str
    categoria: str
    preco: float
    imagem: Optional[str] = None
    link: Optional[str] = None