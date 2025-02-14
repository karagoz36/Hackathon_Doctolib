from fastapi import FastAPI
from app.database import engine
from app import models
from app.routers import users, items

# Création des tables dans la base de données
models.Base.metadata.create_all(bind=engine)

app = FastAPI()

# Inclusion des routes
app.include_router(users.router)
app.include_router(items.router)

@app.get("/")
def root():
    return {"message": "Bienvenue sur FastAPI avec PostgreSQL !"}
