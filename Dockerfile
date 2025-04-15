FROM python:3.10-slim

WORKDIR /app

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    libssl-dev \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Копирование файлов
COPY . .

# Установка зависимостей Python
RUN pip install --no-cache-dir -r requirements.txt

# Запуск бота
CMD ["python", "main.py"]