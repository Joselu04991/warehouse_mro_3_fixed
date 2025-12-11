# Usa Python 3.11
FROM python:3.11-slim

# Crea directorio
WORKDIR /app

# Copia requirements
COPY requirements.txt .

# Instala dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo el proyecto
COPY . .

# EXPONE el puerto que Railway define
ENV PORT=8080
EXPOSE 8080

# Comando de inicio (usa $PORT correctamente)
CMD gunicorn --bind 0.0.0.0:$PORT wsgi:app
