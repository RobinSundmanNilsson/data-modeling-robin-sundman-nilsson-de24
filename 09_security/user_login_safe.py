from connect_postgres import connect_postgres
from sqlalchemy import text

username = input("Enter your username: ")
password = input("Enter you password: ")

with connect_postgres().connect() as conn:
    result = conn.execute(
        text(
            "SELECT * FROM users WHERE username = :username AND password = :password"
        ), {"username": username, "password": password},
    ).fetchall()

    if result:
        print("Login succesful")
        print("Eat all ice cream!")
    else:
        print("Login failed")