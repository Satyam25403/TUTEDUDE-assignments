from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)                       #resolving cross origin issues

@app.route('/submit', methods=['POST'])
def submit():
    data = request.json
    name = data.get('name')
    email = data.get('email')
    return jsonify({"message": f"Received name: {name}, email: {email}"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000)
