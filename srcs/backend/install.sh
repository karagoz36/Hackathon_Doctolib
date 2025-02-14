#!/bin/bash

export PGPASSWORD="$POSTGRES_PASSWORD"

echo "🛠 Suppression des anciennes migrations..."
find /app -type d -name "migrations" -exec rm -rf {} \; 2>/dev/null

# Attendre que PostgreSQL soit prêt
echo "⏳ Attente de PostgreSQL..."

export PGPASSWORD="$POSTGRES_PASSWORD"
until psql -U "$POSTGRES_USER" -h postgres -c '\q' 2>/dev/null; do
    sleep 2
done
echo "✅ PostgreSQL est prêt !"

echo "🛠 Vérification de l'existence de la base de données..."
export PGPASSWORD="$POSTGRES_PASSWORD"

# Vérifier si la base de données existe
DB_EXIST=$(psql -U "$POSTGRES_USER" -h postgres -tAc "SELECT 1 FROM pg_database WHERE datname = '$POSTGRES_DB'")

if [ "$DB_EXIST" != "1" ]; then
    echo "📌 Création de la base de données '$POSTGRES_DB'..."
    psql -U "$POSTGRES_USER" -h postgres -c "CREATE DATABASE $POSTGRES_DB"
    echo "✅ Base de données '$POSTGRES_DB' créée avec succès."
else
    echo "✅ La base de données '$POSTGRES_DB' existe déjà."
fi


# Vérifier si Alembic est configuré
if [ ! -d "/app/migrations" ]; then
    echo "🛠 Initialisation de Alembic..."
    alembic init migrations
fi

# Modifier la configuration d'Alembic pour utiliser la bonne base de données
echo "🔧 Configuration de Alembic..."
sed -i "s|sqlalchemy.url = .*|sqlalchemy.url = postgresql+asyncpg://$POSTGRES_USER:$POSTGRES_PASSWORD@postgres:5432/$POSTGRES_DB|g" /app/alembic.ini

# Créer les migrations si elles n'existent pas encore
if [ -z "$(ls -A /app/migrations/versions 2>/dev/null)" ]; then
    echo "📜 Création des migrations initiales..."
    alembic revision --autogenerate -m "Initial migration"
fi

# Appliquer les migrations
echo "⚡ Application des migrations..."
alembic upgrade head

# Créer un superutilisateur (équivalent à Django createsuperuser)
echo "👤 Création de l'utilisateur admin..."
python /app/create_admin.py

# Lancer l'application FastAPI
echo "🚀 Lancement de FastAPI..."
exec uvicorn app.main:app --host 0.0.0.0 --port 8000
