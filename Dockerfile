# Dockerfile

FROM python:3.10-slim

# Running as root (intentional security issue)
WORKDIR /app

COPY app/ /app/
COPY app/requirements.txt /app/requirements.txt

RUN pip install --upgrade pip && pip install -r /app/requirements.txt


# Exposing sensitive environment variables (intentional security issue)
ENV DB_PASSWORD="super_secret_db_password" \
    API_KEY="sk_live_abcdefghijklmnopqrstuvwxyz12345"

# Running application as root (intentional security issue)
CMD ["python", "app.py"]