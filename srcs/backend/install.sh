#!/bin/bash

# Supprimer les anciens répertoires de migrations (si nécessaire)
find /app -type d -name "migrations" -exec rm -rf {} \; 2>/dev/null

# Créer les migrations avec Alembic
# Note : Assurez-vous d'avoir un fichier alembic.ini et un répertoire migrations configuré.
alembic revision --autogenerate -m "Initial migration"
alembic upgrade head

# Créer un utilisateur dans la base de données (si nécessaire)
# Remplace ce bloc par la logique d'ajout d'un utilisateur dans FastAPI. 
# Cela peut être différent selon ta configuration.
# Exemple pour ajouter un utilisateur par défaut :

python /app/create_user.py --username $POSTGRES_USER --password $POSTGRES_PASSWORD

# Lancer l'application FastAPI
exec uvicorn app.main:app --host 0.0.0.0 --port 8000
