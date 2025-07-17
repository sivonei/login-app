# Imagem base
FROM python:3.9-slim

# Diretório de trabalho
WORKDIR /app

# Copiar arquivos
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Porta da aplicação
EXPOSE 5000

# Comando de inicialização
CMD ["python", "app.py"]
