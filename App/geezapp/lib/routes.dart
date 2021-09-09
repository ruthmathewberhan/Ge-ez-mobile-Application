import 'package:flutter/material.dart';
import 'package:geezapp/Lesson/screens/AdminMain.dart';
import 'package:geezapp/Lesson/screens/details.dart';
import 'package:geezapp/User/screens/profile_screen.dart';
import 'package:geezapp/User/screens/sign_up_screen.dart';
import 'package:geezapp/User/screens/welcome_screen.dart';
import 'package:geezapp/User/screens/login_screen.dart';
import 'package:geezapp/course/screens/GrammarPage.dart';
import 'package:geezapp/course/screens/UserHomePage.dart';
import 'package:geezapp/course/screens/Courses2.dart';
import 'package:geezapp/course/screens/home_screen.dart';
import 'package:geezapp/User/screens/profile_edit.dart';
import 'package:geezapp/Lesson/screens/admin_login.dart';
import 'package:geezapp/teacher/screens/create_lessons.dart';
import 'package:geezapp/teacher/screens/create_test.dart';
import 'package:geezapp/teacher/screens/teacher_create.dart';
import 'package:geezapp/teacher/screens/teacher_home.dart';

class AppRoute {
  static const initialRoute = TeacherHome.routeName;

  static final routes = {
    WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
    ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
    UserHomePage.routeName: (BuildContext context) => UserHomePage(),
    Courses2.routeName: (BuildContext context) => Courses2(),
    GrammarPage.routeName: (BuildContext context) => GrammarPage(),
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    ProfileEdit.routeName: (BuildContext context) => ProfileEdit(),
    AdminLoginScreen.routeName: (BuildContext context) => AdminLoginScreen(),
    MainPage.routeName: (BuildContext context) => MainPage(
          title: 'አድሚን',
        ),
    DetailPage.routeName: (BuildContext context) => DetailPage(),
    TeacherHome.routeName: (BuildContext context) => TeacherHome(),
    TeacherCreate.routeName: (BuildContext context) => TeacherCreate(),
    CreateLessonApp.routeName:(BuildContext context) => CreateLessonApp(),
    CreateTestApp.routeName:(BuildContext context) => CreateTestApp(),
  };
}
