# Основа образа
FROM python:3.9-slim-buster

# Установка зависимостей
WORKDIR /test
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирование приложения
COPY . .

# Порт для приложения
EXPOSE 32777

# Команда запуска
CMD ["python", "test.py"]