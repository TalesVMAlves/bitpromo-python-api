from sqlalchemy import create_engine
import chromadb
from chromadb.utils import embedding_functions
from core.init_config import settings, DATABASE_URL, OPENAI_KEY

engine = create_engine(DATABASE_URL)

chroma_client = chromadb.PersistentClient(path=settings['embeddings']['chroma_path'])
openai_ef = embedding_functions.OpenAIEmbeddingFunction(
    api_key=OPENAI_KEY,
    model_name=settings['embeddings']['model']
)

def get_chroma_collection():
    return chroma_client.get_or_create_collection("produtos_embeddings", embedding_function=openai_ef)