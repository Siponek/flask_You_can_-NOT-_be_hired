from flask import Flask
from flask import request, jsonify, render_template
from flask_cors import CORS, cross_origin
from datetime import datetime

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

# if run from command line as python flask_host.py
def main():
    app.run(host='0.0.0.0', port=8000, debug=True)
    
@app.route('/')
def index():
    return render_template(template_name_or_list='index.html',utc_dc= datetime.utcnow())

@app.route('/get_fifa_data', methods=['GET'])
def get_fifa_data():
    def wololo():
        return 'wololo'
    

    return jsonify({'data': 'fifa data'})


if __name__ == '__main__':
    main()