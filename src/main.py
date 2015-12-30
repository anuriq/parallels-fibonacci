import fibonacci
from flask import Flask, abort, jsonify, request, make_response

app = Flask("fibonacci")


def main():
    app.run()


@app.route('/')
def index():
    return "This is REST API to get fibonacci number. Go to /api/v1/get"


@app.route('/api')
def api_index():
    return "This is REST API to get fibonacci number. Go to /api/v1/get"


@app.route('/api/v1')
def api_v1_index():
    return "This is REST API to get fibonacci number. Go to /api/v1/get"


@app.route('/api/v1/get')
def api_v1_get_index():
    return "You can get Nth Fibonacci number by requesting /api/v1/get/<N> where <N> is an integer from 1 to 100."


@app.route('/api/v1/get/<number>', methods=['GET'])
def api_get(number):
    try:
        number = int(number)
    except:
        abort(400)
    if number > 100 or number < 1:
        abort(400)
    result = fibonacci.fibonacci_number(number)
    return jsonify({'result': result})


@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)


@app.errorhandler(400)
def not_found(error):
    return make_response(jsonify({'error': 'Bad request. Input should be integer from 1 to 100.'}), 400)


if __name__ == "__main__":
    main()
