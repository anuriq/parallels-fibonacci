import fibonacci
from flask import Flask

app = Flask("fibonacci")


@app.route('/')
def index():
    return "This is REST API to get fibonacci number. Go to ./api/v1/get"


def main():
    app.run()


if __name__ == "__main__":
    main()
