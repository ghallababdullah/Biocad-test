# ТЕСТОВОЕ ЗАДАНИЕ НА СТАЖИРОВКУ
##  1- Создать веб приложение “hello world” на любом языке программирования, которое должно работать на порту 32777 ;
  Для создания веб-приложения “Hello, world!” на Python, работающего на порту 32777, мыбудем исполбзовать фреймворк Flask. Вот код:
 ```
from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello_world():
    return "Hello, world!"
if __name__ == "__main__":
    app.run(debug=True, port=32777)
```
 Теперь можно открыть браузер и перейти по адресу http://127.0.0.1:32777/ .МЫ увидим  “Hello, world!” :
 
 ![Screenshot 2024-11-23 181523](https://github.com/user-attachments/assets/eca09b12-1701-4d05-b136-f91146c24163)

## (2-3) -  Установить Docker на рабочий компьютери и затем Собрать контейнер с вашим приложением и опубликовать его на Docker Hub ;
После утсановления Docker на рабочий компьютери, поступим на собрание контейнера с нашим приложением и опубликовать его на Docker Hub. Для этого, мы выполняем следующие шаги :
####  1. Создаем файл с  именем Dockerfile в той же директории, что и наш test.py. Вставим в него следующий код:
 ```
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
```
#### 2. Создаем файл requirements.txt в той же директории. Он должен содержать зависимость Flask:
```
Flask
```
#### 3. Создаем Docker-образ:

Откроем терминал и переедем  в директорию с файлами Dockerfile, test.py, и requirements.txt. Затем выполним следующие команды:
```
docker build -t abdullahghallab/hello-world-flask .
```
#### 4. Опубликуем Docker-образ через команду :
```
docker push yourdockerhubusername/hello-world-flask
```
#### 5. После успешной публикации, можео проверять образ на Docker Hub :
```
docker run -p 32777:32777 abdullahghallab/hello-world-app
```
![Screenshot 2024-11-23 192752](https://github.com/user-attachments/assets/b75f5980-ec52-4ca7-b2aa-e45cce089900)
![image](https://github.com/user-attachments/assets/c558d435-641d-407d-81d2-c9b56b891dc9)


## 4- Установить Minikube используя оригинальную инструкцию. После установки необходимо развернуть minikube cluster;
#### 1. Установка: Так как, не было определино на какой системы нужно установить Minikube, я установил его на Windows 11. нужно обратить внимание что, установка на обях системах не сильно отличается. только на windows Убедимся, что у нас установлен VirtualBox или Hyper-V. 
#### 2. Запуск кластера: Откроем командную строку  выполним:
```
minikube start
```
#### 3.Проверка установки:
```
minikube status
```

