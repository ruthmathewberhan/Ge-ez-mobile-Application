from appFolder import db, api
import app


class User(db.Model):
    __tablename__ = "user"
    user_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(50), nullable=False)
    firstName = db.Column(db.String(100), nullable=False)
    secondName = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(50), nullable=False)
    userType = db.Column(db.String(50), nullable=False)
    photo = db.Column(db.String(500), nullable=False)
    # user_status = db.relationship(
    # 'UserStatus', backref = 'user status', lazy = True)
    # user_exam = db.relationship('UserExam', backref='user exam', lazy=True)
    # question = db.relationship('Question', backref='question', lazy=True)
    # comment = db.relationship('Comment', backref='comment', lazy=True)


class UserStatus(db.Model):
    __tablename__ = "user_status"
    userStatus_id = db.Column(
        db.Integer, primary_key=True, autoincrement=True)
    level_id = db.Column(db.Integer, db.ForeignKey(
        'level.level_id'), nullable=False)
    course_id = db.Column(db.Integer, db.ForeignKey(
        'course.course_id'), nullable=False)
    lesson_id = db.Column(db.Integer, db.ForeignKey(
        'lesson.lesson_id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey(
        'user.user_id'), nullable=False)


class UserExam(db.Model):
    __tablename__ = "user_exam"
    userExam_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    status = db.Column(db.String, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey(
        'user.user_id'), nullable=False)
    level_id = db.Column(db.Integer, db.ForeignKey(
        'level.level_id'), nullable=False)
    mark = db.Column(db.String, nullable=False)


class Course(db.Model):
    __tablename__ = "course"
    course_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    courseName = db.Column(db.String(100), nullable=False)
    level_id = db.Column(db.Integer, db.ForeignKey(
        'level.level_id'), nullable=False)
    # userStatus = db.relationship(
    #     'UserStatus', backref='get plant', lazy=True)
    # lesson = db.relationship(
    #     'Lesson', backref='lesson', lazy=True)


class Level(db.Model):
    __tablename__ = "level"
    level_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    level_name = db.Column(db.String(100), nullable=False)
    # course = db.relationship('Course', backref='course', lazy=True)
    # userExam = db.relationship('UserExam', backref='user exam', lazy=True)
    # userStatus = db.relationship(
    #     'UserStatus', backref='user status', lazy=True)
    # question = db.relationship(
    #     'Question', backref='question', lazy=True)
    # lesson = db.relationship(
    #     'Lesson', backref='lesson', lazy=True)


class Lesson(db.Model):
    __tablename__ = "lesson"
    lesson_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    lessonName = db.Column(db.String(100), nullable=False)
    level_id = db.Column(db.Integer, db.ForeignKey(
        'level.level_id'), nullable=False)
    course_id = db.Column(db.Integer, db.ForeignKey(
        'course.course_id'), nullable=False)
    content = db.Column(db.String(100), nullable=False)
    status = db.Column(db.String(100), nullable=False)
    teacher_id = db.Column(db.Integer, db.ForeignKey(
        'user.user_id'), nullable=False)
    # comment = db.relationship(
    #     'Comment', backref='comment', lazy=True)
    # userStatus = db.relationship(
    #     'UserStatus', backref='user status', lazy=True)


class Comment(db.Model):
    __tablename__ = "Comment"
    comment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    comment = db.Column(db.String(100), nullable=False)
    lesson_id = db.Column(db.Integer, db.ForeignKey(
        'lesson.lesson_id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey(
        'user.user_id'), nullable=False)
    status = db.Column(db.String, nullable=False)


class Question(db.Model):
    __tablename__ = "question"
    question_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    question = db.Column(db.String(100), nullable=False)
    level_id = db.Column(db.Integer, db.ForeignKey(
        'level.level_id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey(
        'user.user_id'), nullable=False)
    status = db.Column(db.String(100), nullable=False)
    # choice = db.relationship('Choice', backref='choice', lazy=True)


class Choice(db.Model):
    __tablename__ = "choice"
    choice_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    choice_1 = db.Column(db.String(100), nullable=False)
    choice_2 = db.Column(db.String(100), nullable=False)
    choice_3 = db.Column(db.String(100), nullable=False)
    choice_4 = db.Column(db.String(100), nullable=False)
    Question_id = db.Column(db.Integer, db.ForeignKey(
        'question.question_id'), nullable=False)
    Answer = db.Column(db.String(100), nullable=False)


db.create_all()
