from flask import Flask, request, abort, views
# from requests.api import request
from flask_restful import Api, Resource, reqparse, abort, fields, marshal_with
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

app.config['SECRET_KEY'] = 'thisisourprojectsecretkey '
api = Api(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///GeezApp.db'
db = SQLAlchemy(app)

from appFolder.routes import *
from appFolder import models
#db.create_all()