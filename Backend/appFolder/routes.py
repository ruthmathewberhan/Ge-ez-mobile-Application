from flask import Flask, request, jsonify
from flask_restful import Api, Resource, reqparse, abort, fields, marshal_with
from appFolder.models import User
from werkzeug.security import generate_password_hash, check_password_hash
from appFolder import app, db, api
import json

resource_fields = {
    'user_id': fields.Integer,
    'email': fields.String,
    'firstName': fields.String,
    'secondName': fields.String,
    'password': fields.String,
    'userType': fields.String,
    'photo': fields.String,
}

#signin or login


class UseSignIn(Resource):
    def post(self):
        email = request.json['email']
        password = request.json['password']
        result = User.query.filter_by(email=email).first()
        if result:
            if result.password == password:
                return {"message": "login"}
        return {"message": "not login"}

#signup or register


class UserSignUp(Resource):
    @marshal_with(resource_fields)
    def post(self):
        new_user = User()
        new_user.email = request.json['email']
        new_user.firstName = request.json['firstName']
        new_user.secondName = request.json['secondName']
        new_user.password = request.json['password']
        new_user.userType = request.json['userType']
        new_user.photo = request.json['photo']

        db.session.add(new_user)
        db.session.commit()
        return new_user


api.add_resource(UseSignIn, "/api/v1/user/login")
api.add_resource(UserSignUp,  "/api/v1/user/register")
