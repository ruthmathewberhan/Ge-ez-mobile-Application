import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/profile_screen.dart';
import 'package:geezapp/User/screens/sign_up_screen.dart';
import 'package:geezapp/User/screens/welcome_screen.dart';
import 'package:geezapp/User/screens/login_screen.dart';
import 'package:geezapp/course/screens/GrammarPage.dart';
import 'package:geezapp/course/screens/UserHomePage.dart';
import 'package:geezapp/course/screens/Courses2.dart';
import 'package:geezapp/course/screens/home_screen.dart';

class AppRoute {
  static const initialRoute = LoginScreen.routeName;

  static final routes = {
    WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
    ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
    UserHomePage.routeName: (BuildContext context) => UserHomePage(),
    Courses2.routeName: (BuildContext context) => Courses2(),
    GrammarPage.routeName: (BuildContext context) => GrammarPage(),
    HomeScreen.routeName: (BuildContext context) => HomeScreen()
  };
}
