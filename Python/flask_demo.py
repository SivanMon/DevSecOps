from flask import Flask

siv = Flask(__name__)

@siv.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@siv.route("/data", methods=['GET'])
def get_data():
    return "Hey"

siv.run('0.0.0.0', port=5000)