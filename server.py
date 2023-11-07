# Write a simple Hello world flask application
# Run the application using python server.py
# Open the browser and type http://localhost:5000

from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!\n"

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')

