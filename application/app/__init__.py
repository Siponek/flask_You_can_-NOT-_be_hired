from flask import Flask
import click
import logging

logging.getLogger("werkzeug").setLevel(logging.CRITICAL)
app = Flask(__name__)
app.config.from_pyfile("config/debug_environment.cfg")

# This will be for docker-compose
# app.config.from_envvar('CONFIGURATION_FILE')
app.config.update(
    CORS_Headers="Content-Type",
)
from app import views
