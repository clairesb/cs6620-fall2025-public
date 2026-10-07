FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install requirements from requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy over other files
COPY . .

RUN mkdir -p /opt/audio /opt/data

EXPOSE 5000

CMD ["python", "app.py"]