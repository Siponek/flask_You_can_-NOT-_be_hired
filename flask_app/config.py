from pathlib import Path
from os import environ

basedir = Path(__file__).parent

class Config:
    SECRET_KEY = environ.get("SECRET_KEY") or "you-will-never-guess"
    SQLALCHEMY_DATABASE_URI = environ.get("DATABASE_URL") or "sqlite:///" + str(basedir / "app.db")
    SQLALCHEMY_TRACK_MODIFICATIONS = False