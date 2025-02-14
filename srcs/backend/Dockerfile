FROM python:3.11

WORKDIR /app

COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN apt-get update && apt-get install -y postgresql-client
COPY ./install.sh .

COPY . .

CMD ["bash", "./install.sh"]

# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
