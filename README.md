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
docker push yourdockerhubusername/hello-world-app
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
![image](https://github.com/user-attachments/assets/25530a14-4ac0-4ac5-a4af-fe87b0a94377)

## 5- Вам необходимо создать deployment с 2 репликами вашего приложения;
Для создания Deployment с двумя репликами нашего приложения , необходимо использовать kubectl.
#### Создаем YAML-файл для Deployment:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: hello-world
  template:
    metadata:
      labels:
        app: hello-world
    spec:
      containers:
        - name: hello-world-container
          image: abdullahghallab/hello-world-app:latest
          ports:
            - containerPort: 32777
```
#### создаем Deployment в нашем Kubernetes-кластер
```
kubectl apply -f deployment.yaml
```
#### Проверим статус:
```
kubectl get deployments
```
![image](https://github.com/user-attachments/assets/58d2cd42-2efd-45ec-9ff3-d98c00bdb495)

## 6-Создать сервис, через который у вас будет доступ на эти "поды". Выбор типа сервиса остается на ваше усмотрение;
#### Сервис типа NodePort (простой внешний доступ):
Этот тип сервиса назначает случайный порт на каждом узле (в данном случае, на нашей машине Minikube), и все запросы на этот порт перенаправляются на наши поди.
#### Создаем файл service.yaml:
```
apiVersion: v1
kind: Service
metadata:
  name: hello-world-service
spec:
  type: NodePort
  selector:
    app: hello-world
  ports:
    - protocol: TCP
      port: 80
      targetPort: 32777
      nodePort: 32000
```
#### Применим сервис:
```
kubectl apply -f service.yaml
```
#### Проверьте статус сервиса:
```
kubectl get service hello-world-service
```

![image](https://github.com/user-attachments/assets/9a68bcce-76cc-4831-a907-e25c22e69bd6)
#### 7- Запустить в minikube режим проброса портов и подключиться к вашим контейнерам через веб браузер;

![image](https://github.com/user-attachments/assets/80edbc82-24c2-42c5-abd5-8f281d4d1550)

