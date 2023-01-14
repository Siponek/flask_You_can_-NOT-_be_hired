from flask import Flask
from flask import request, jsonify, render_template
from flask_cors import CORS, cross_origin
from datetime import datetime

from app import app

cors = CORS(app=app, resources={r"/api/*": {"origins": "*"}}, vary_header=True, supports_credentials=True)
# This is for local testing
app.config.from_pyfile('config/debug_environment.cfg')

# This will be for docker-compose
# app.config.from_envvar('CONFIGURATION_FILE')
app.config.update(
        CORS_Headers='Content-Type',
)

# if run from command line as python flask_host.py
def main():
    app.run(host='0.0.0.0', port=80, debug=True)
    
@app.route('/', strict_slashes=False, methods=['GET'])
@app.route('/index', strict_slashes=False, methods=['GET'])
def index():
    return render_template(template_name_or_list='index.html',utc_dc= datetime.utcnow())

@app.route("/web_21", methods=['GET'])
def web_21():
    return render_template(template_name_or_list='web_21.html')

@app.route('/get_fifa_data', methods=['GET'])
def get_fifa_data():
    def wololo():
        return 'wololo'
    return jsonify({'data': 'fifa data'})


if __name__ == '__main__':
    main()