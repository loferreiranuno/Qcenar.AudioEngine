# app/views.py

from app import app
from flask import request, jsonify

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        url = request.form.get('url')
        return jsonify({'url': url})
    return '''
        <form method="post">
            URL: <input type="text" name="url">
            <input type="submit" value="Submit">
        </form>
    '''