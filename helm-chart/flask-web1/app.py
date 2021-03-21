from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'I am Web Server-1'


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
