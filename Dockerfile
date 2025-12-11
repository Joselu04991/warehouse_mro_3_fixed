FROM python:3.11-slim

WORKDIR /app

# Instalación de dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar proyecto
COPY . .

# Variables de entorno obligatorias
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

EXPOSE 8080

# Comando de inicio para Railway
CMD sh -c "gunicorn --bind 0.0.0.0:$PORT wsgi:app"
