# app/app.py

from flask import Flask, request, jsonify
import os
import subprocess
import json

app = Flask(__name__)

# Insecure hardcoded credentials (intentional security issue)
DB_USERNAME = "admin"
DB_PASSWORD = "super_secret_password123"

# Insecure storage of API key (intentional security issue)
API_KEY = "sk_test_51ABCDEFghijklmnopqrstuvwxyz123456789ABCDEFGHIJKLMN"

@app.route('/')
def home():
    return "Hello, DevSecOps Pipeline!"

@app.route('/api/data')
def get_data():
    return jsonify({"message": "This is some API data"})

# Insecure command execution (intentional security issue)
@app.route('/run-command')
def run_command():
    cmd = request.args.get('cmd', 'echo "No command provided"')
    output = subprocess.check_output(cmd, shell=True)
    return output.decode('utf-8')

# SQL Injection vulnerability (intentional security issue)
@app.route('/users')
def get_user():
    user_id = request.args.get('id', '1')
    # This is vulnerable to SQL injection
    query = f"SELECT * FROM users WHERE id = {user_id}"
    return query

# Stores passwords insecurely (intentional security issue)
@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')  # Plain text password
    
    # No password hashing here (intentionally bad)
    user = {"username": username, "password": password}
    return jsonify({"message": "User registered", "user": user})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))