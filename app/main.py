from fastapi import FastAPI
from app.routes import embeddings, recomendacao

app = FastAPI(title="BitPromo API")

app.include_router(recomendacao.router, prefix="/api/v1/busca")
app.include_router(embeddings.router, prefix="/api/v1/insert")

@app.get("/")
def health():
    return {"status": "ok"}