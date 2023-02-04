# app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/receive_url", methods=['POST'])
def receive_url():
    url = request.form.get('url')
    if url:
        # Perform operations with the received URL
        return "URL received: {}".format(url)
    else:
        return "No URL provided"

if __name__ == "__main__":
    app.run(debug=False, host='0.0.0.0')