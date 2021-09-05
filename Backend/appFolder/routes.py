from flask import Flask, request, jsonify
from flask_restful import Api, Resource, reqparse, abort, fields, marshal_with
from appFolder.models import User
from werkzeug.security import generate_password_hash, check_password_hash
from appFolder import app, db, api
import json


user_update_args = reqparse.RequestParser()
user_update_args.add_argument('email', type=str, help='email')
user_update_args.add_argument('firstName', type=str, help='first name')
user_update_args.add_argument('secondName', type=str, help='second name')
user_update_args.add_argument('password', type=str, help='password')
user_update_args.add_argument('userType', type=str, help='user type')
user_update_args.add_argument('photo', type=str, help='photo')


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
                return {"message": "login", "user_id": result.user_id, "email": result.email, "password": result.password}
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


class UserProfile(Resource):
    @marshal_with(resource_fields)
    def get(self, id):
        result = User.query.filter_by(user_id=id).all()
        if result:
            return result
        return "user id not found"

    def delete(self, id):
        result = User.query.filter_by(user_id=id).first()

        if result:
            db.session.delete(result)
            db.session.commit()
        return 'deleted successfully'

    @marshal_with(resource_fields)
    def patch(self, id):
        args = user_update_args.parse_args()
        result = User.query.filter_by(user_id=id).first()
        if not result:
            abort(404, message="id doesn't exist, cannot update")

        if args['email']:
            result.email = args['email']
        if args['firstName']:
            result.firstName = args['firstName']
        if args['secondName']:
            result.secondName = args['secondName']
        if args['password']:
            result.password = args['password']
        if args['photo']:
            result.photo = args['photo']
        if args['userType']:
            result.userType = args['userType']
        db.session.commit()

        return result


api.add_resource(UseSignIn, "/api/v1/user/login")
api.add_resource(UserSignUp,  "/api/v1/user/register")
api.add_resource(UserProfile,  "/api/v1/user/profile/<int:id>")
