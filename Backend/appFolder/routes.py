from flask import Flask, request, jsonify
from flask_restful import Api, Resource, reqparse, abort, fields, marshal_with
from appFolder.models import User, Lesson, Question, Choice, Comment, Course, Level, UserStatus
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

lesson_update_args = reqparse.RequestParser()
lesson_update_args.add_argument('lessonName', type=str, help='lesson name')
lesson_update_args.add_argument('level_id', type=int, help="level id")
lesson_update_args.add_argument('course_id', type=int, help="course id")
lesson_update_args.add_argument('content', type=str, help="lesson content")
lesson_update_args.add_argument('status', type=str, help="lesson status")
lesson_update_args.add_argument('teacher_id', type=int, help="teacher id")

question_update_args = reqparse.RequestParser()
question_update_args.add_argument('question', type=str, help="question name")
question_update_args.add_argument('level_id', type=int, help="level id")
question_update_args.add_argument('user_id', type=int, help="user id")
question_update_args.add_argument('status', type=str, help="user status")
question_update_args.add_argument('choice_1', type=str, help="choice 1")
question_update_args.add_argument('choice_2', type=str, help="choice 2")
question_update_args.add_argument('choice_3', type=str, help="choice 3")
question_update_args.add_argument('choice_4', type=str, help="choice 4")
question_update_args.add_argument('Answer', type=str, help="answer")

status_update_args = reqparse.RequestParser()
status_update_args.add_argument('level_id',type=int,help='level id')

resource_fields = {
    'user_id': fields.Integer,
    'email': fields.String,
    'firstName': fields.String,
    'secondName': fields.String,
    'password': fields.String,
    'userType': fields.String,
    'photo': fields.String,
}

lesson_fields = {
    'lesson_id': fields.Integer,
    'lessonName': fields.String,
    'level_id': fields.Integer,
    'course_id': fields.Integer,
    'content': fields.String,
    'status': fields.String,
    'teacher_id': fields.Integer,
}

question_fields = {
    'question_id': fields.Integer,
    'question': fields.String,
    'level_id': fields.Integer,
    'user_id': fields.Integer,
    'status': fields.String
}

comment_fields ={
    'comment_id' : fields.Integer,
    'comment': fields.String,
    'lesson_id' : fields.Integer,
    'user_id':fields.Integer,
    'status' :fields.String,

}
course_field = {
    'course_id':fields.Integer,
    'courseName':fields.String,
    'level_id':fields.Integer
}


level_fields ={
    'level_id' : fields.Integer,
    'level_name' : fields.String
}

user_status_fields = {
    'userStatus_id': fields.Integer,
    'level_id': fields.Integer,
    'course_id': fields.Integer,
    'lesson_id': fields.Integer,
    'user_id': fields.Integer
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

class LessonResource(Resource):
    @marshal_with(lesson_fields)
    def get(self, lesson_status):
        result = Lesson.query.filter_by(status=lesson_status).all()
        return result


class LessonByIdResource(Resource):
    def delete(self, id):
        result = Lesson.query.filter_by(lesson_id=id).first()

        if result:
            db.session.delete(result)
            db.session.commit()
            return 'deleted successfully'
        return 'no such lesson'

    @marshal_with(lesson_fields)
    def patch(self, id):
        args = lesson_update_args.parse_args()
        lesson = Lesson.query.filter_by(lesson_id=id).first()

        if not lesson:
            abort(404, message="id doesn't exist, cannot update")

        if args['lessonName']:
            lesson.lessonName = args['lessonName']
        if args['level_id']:
            lesson.level_id = args['level_id']
        if args['course_id']:
            lesson.course_id = args['course_id']
        if args['content']:
            lesson.content = args['content']
        if args['status']:
            lesson.status = args['status']
        if args['teacher_id']:
            lesson.teacher_id = args['teacher_id']

        db.session.commit()
        return lesson


class QuestionResource(Resource):
    @marshal_with(question_fields)
    def get(self, question_status):
        result = Question.query.filter_by(status=question_status).all()
        return result


class QuestionByIdResource(Resource):
    def delete(self, id):
        question = Question.query.filter_by(question_id=id).first()
        question_choice = Choice.query.filter_by(Question_id=id).first()

        if question_choice:
            db.session.delete(question_choice)
            db.session.commit()

        if question:
            db.session.delete(question)
            db.session.commit()

        return 'deleted from choice and question table successfully'

    def patch(self, id):
        args = question_update_args.parse_args()
        question_res = Question.query.filter_by(question_id=id).first()
        question_choice = Choice.query.filter_by(Question_id=id).first()

        if not question_res or not question_choice:
            abort(404, message="id doesn't exist, cannot update")

        # Update question table
        if args['question']:
            question_res.question = args['question']
        if args['level_id']:
            question_res.level_id = args['level_id']
        if args['user_id']:
            question_res.user_id = args['user_id']
        if args['status']:
            question_res.status = args['status']

        # Update choice table
        if args['choice_1']:
            question_choice.choice_1 = args['choice_1']
        if args['choice_2']:
            question_choice.choice_2 = args['choice_2']
        if args['choice_3']:
            question_choice.choice_3 = args['choice_3']
        if args['choice_4']:
            question_choice.choice_4 = args['choice_4']
        if args['Answer']:
            question_choice.Answer = args['Answer']

        db.session.commit()

        return_json = {
            'question_id': question_res.question_id,
            'question': question_res.question,
            'level_id': question_res.level_id,
            'user_id': question_res.user_id,
            'status': question_res.status,
            'choice_id': question_choice.choice_id,
            'choice_1': question_choice.choice_1,
            'choice_2': question_choice.choice_2,
            'choice_3': question_choice.choice_3,
            'choice_4': question_choice.choice_4,
            'Question_id': question_choice.Question_id,
            'Answer': question_choice.Answer
        }
        return jsonify(return_json)


class CommentResource (Resource):
    @marshal_with(comment_fields)
    def get(self, id):
        result1 = Comment.query.filter_by(lesson_id=id).all()
        if result1:
            return result1
        return "lesson id not found"

class TeacherComment (Resource):
    @marshal_with(comment_fields)
    def get(self, id):
        result1 = Comment.query.filter_by(user_id=id).all()
        if result1:
            return result1
        return "Teaher id not found"


class  NewComment(Resource):
    @marshal_with(comment_fields)
    def post(self):
        new_comment =Comment()
        new_comment.comment = request.json['comment']
        new_comment.lesson_id = request.json['lesson_id']
        new_comment.user_id = request.json['user_id']
        new_comment.status = request.json['status']

        db.session.add(new_comment)
        db.session.commit()
        return new_comment

class CommentByStatus(Resource):
    @marshal_with(comment_fields)
    def get(self, status_id):
        result1 = Comment.query.filter_by(status=status_id).all()
        if result1:
            return result1
        return "status not found"

class CourseResource (Resource):
    @marshal_with(course_field)
    def get(self,id):
        result = Course.query.filter_by(level_id=id).all()
        if result:
            return result
        return "level id not found"

class LessonResourceElda(Resource):
    @marshal_with(lesson_fields)
    def get(self,id):
        result = Lesson.query.filter_by(course_id=id).all()
        if result:
            return result
        return "course id not found"

class ContentResource(Resource):
    @marshal_with(lesson_fields)
    def get(self,id):
        result = Lesson.query.filter_by(lesson_id=id).first()
        if result:
            return result
        return "content not found"

class LevelResource(Resource):
    @marshal_with(level_fields)
    def get(self,id):
        userResult = UserStatus.query.filter_by(user_id=id).first()
        if userResult:
            levelResult = userResult.level_id
            result = Level.query.filter_by(level_id = levelResult).first()
            if result:
                return result
        return "level not found"
    @marshal_with(user_status_fields)
    def patch(self,id):
        args = status_update_args.parse_args()
        userResult = UserStatus.query.filter_by(user_id=id).first()

        if args['level_id'] and userResult: #the updated id
            userResult.level_id = args['level_id']

        db.session.commit()

        return userResult



api.add_resource(UseSignIn, "/api/v1/user/login")
api.add_resource(UserSignUp,  "/api/v1/user/register")
api.add_resource(UserProfile,  "/api/v1/user/profile/<int:id>")
api.add_resource(LessonResource, "/api/v1/lessons/<string:lesson_status>")
api.add_resource(QuestionResource,"/api/v1/questions/<string:question_status>")
api.add_resource(LessonByIdResource, "/api/v1/lessons/<int:id>")
api.add_resource(QuestionByIdResource, "/api/v1/questions/<int:id>")
api.add_resource(CommentResource, "/api/v1/comment/lesson/<int:id>")
api.add_resource(TeacherComment, "/api/v1/comment/teacher/<int:id>")
api.add_resource(NewComment, "/api/v1/comment")
api.add_resource(CommentByStatus,  "/api/v1/comment/status/<string:status_id>")
api.add_resource(CourseResource, '/api/v1/courses/<int:id>')
api.add_resource(LessonResourceElda, '/api/v1/courses/lessons/<int:id>')
api.add_resource(ContentResource, '/api/v1/courses/lessons/content/<int:id>')
api.add_resource(LevelResource, '/api/v1/user/level/<int:id>')