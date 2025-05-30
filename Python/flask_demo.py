from flask import Flask, request

cities = {}

siv = Flask('sivan_app')

@siv.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@siv.route("/data", methods=['GET'])
def get_data():
    return "Hey"

@siv.route("/city", methods=['POST'])
def new_city():
    data = request.get_json()
    cities[data['name']] = data['area']
    return "you added" + str(data), 201

@siv.route("/city", methods=['GET'])
def show_cities():
    return cities

siv.run('0.0.0.0', port=5000)