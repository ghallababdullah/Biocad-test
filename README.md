# ТЕСТОВОЕ ЗАДАНИЕ НА СТАЖИРОВКУ
##  1- Создать веб приложение “hello world” на любом языке программирования, которое должно работать на порту 32777 :
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
 Теперь можно открыть браузер и перейти по адресу http://127.0.0.1:32777/.МЫ увидим  “Hello, world!” :
 
 ![Screenshot 2024-11-23 181523](https://github.com/user-attachments/assets/eca09b12-1701-4d05-b136-f91146c24163)

## Установить Docker на рабочий компьютер;
