# -----------------------------
# 1. Imagen base
# -----------------------------
FROM python:3.11-slim

# -----------------------------
# 2. Directorio principal
# -----------------------------
WORKDIR /app

# -----------------------------
# 3. Copiar requirements e instalar
# -----------------------------
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# -----------------------------
# 4. Copiar todo el proyecto
# -----------------------------
COPY . .

# -----------------------------
# 5. Railway asigna PORT en runtime
# -----------------------------
ENV PORT=8080

# -----------------------------
# 6. Exponer puerto
# -----------------------------
EXPOSE 8080

# -----------------------------
# 7. Comando de arranque con Gunicorn
# -----------------------------
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT} wsgi:app"]
