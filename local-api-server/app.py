from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
# Enable CORS for all routes and all origins
CORS(app, resources={r"/*": {"origins": "*"}})

# Sample data
data = {
    "users": [
        {"id": 1, "name": "John Doe", "email": "john@example.com"},
        {"id": 2, "name": "Jane Smith", "email": "jane@example.com"},
        {"id": 3, "name": "Bob Johnson", "email": "bob@example.com"}
    ],
    "products": [
        {"id": 1, "name": "Laptop", "price": 999.99},
        {"id": 2, "name": "Smartphone", "price": 699.99},
        {"id": 3, "name": "Headphones", "price": 149.99}
    ]
}

@app.route('/api/users', methods=['GET'])
def get_users():
    return jsonify(data["users"])

@app.route('/api/products', methods=['GET'])
def get_products():
    return jsonify(data["products"])

@app.route('/api/status', methods=['GET'])
def get_status():
    return jsonify({"status": "API is running", "timestamp": "2025-10-21"})

if __name__ == '__main__':
    # Using port 54512 as specified in the runtime information
    app.run(host='0.0.0.0', port=54512, debug=True)
