from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.database import engine
from app import models
from app.routers import users, items

# Création des tables dans la base de données
models.Base.metadata.create_all(bind=engine)

app = FastAPI()

# Ajout du middleware CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], 
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
# Inclusion des routes
app.include_router(users.router)
app.include_router(items.router)

@app.get("/api/")
def root():
	return {"message": "Bienvenue sur FastAPI avec PostgreSQL !"}
