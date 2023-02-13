from datetime import datetime
from os import getenv, environ
from sys import stderr

from flask import Flask, request, json, jsonify, render_template
from flask_cors import CORS, cross_origin
from werkzeug.exceptions import HTTPException

from app import app


cors = CORS(
    app=app,
    resources={r"/api/*": {"origins": "*"}},
    vary_header=True,
    supports_credentials=True,
)
# This is for local testing


# if run from command line as python flask_host.py
def main():
    app.logger.disabled = True
    # WSGI server runs on port LISTEN_PORT by default
    app.run(
        host="0.0.0.0",
        debug=True,
    )


# @app.errorhandler(HTTPException)
# def handle_exception(e):
#     """Return JSON instead of HTML for HTTP errors."""
#     # start with the correct headers and status code from the error
#     response = e.get_response()
#     # replace the body with JSON
#     response.data = json.dumps(
#         {
#             "code": e.code,
#             "name": e.name,
#             "description": e.description,
#         }
#     )
#     response.content_type = "application/json"
#     return response


@app.route("/", strict_slashes=False, methods=["GET"])
@app.route("/index", strict_slashes=False, methods=["GET"])
def index():
    return render_template(
        template_name_or_list="index.html", utc_dc=datetime.utcnow()
    )


@app.route("/web_21", methods=["GET"])
def web_21():
    return render_template(template_name_or_list="web_21.html")


@app.route("/test", methods=["GET"])
def test():
    return render_template(template_name_or_list="test.html")


@app.route("/day4", methods=["GET"])
def task4():
    return render_template(template_name_or_list="day4.html")


@app.route("/day5", methods=["GET"])
def task5():
    return render_template(template_name_or_list="day5.html")


@app.route("/get_fifa_data", methods=["GET"])
def get_fifa_data():
    def wololo():
        return "wololo"

    return jsonify({"data": "fifa data"})


if __name__ == "__main__":
    main()
