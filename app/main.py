from fastapi import FastAPI
from app.routes import recomendacao

app = FastAPI(title="BitPromo API")

app.include_router(recomendacao.router, prefix="/api/v1")

@app.get("/")
def health():
    return {"status": "ok"}