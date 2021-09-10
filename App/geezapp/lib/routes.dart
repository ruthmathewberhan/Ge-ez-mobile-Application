import 'package:flutter/material.dart';
import 'package:geezapp/profile/signup/screens/signup.dart';
import 'package:geezapp/User/screens/welcome_screen.dart';
import 'package:geezapp/profile/profile_screen/screens/profile_screen.dart';
import 'package:geezapp/course/screens/GrammarPage.dart';
import 'package:geezapp/course/screens/UserHomePage.dart';
import 'package:geezapp/course/screens/Courses2.dart';
import 'package:geezapp/course/screens/home_screen.dart';
import 'package:geezapp/login/screens/login.dart';
import 'package:geezapp/User/screens/profile_edit.dart';

import 'login/login_auth.dart';
import 'login/repository/login.dart';

class AppRoute {
  static const initialRoute = LoginAuth.routeName;

  static final routes = {
    WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(userRepository: UserRepository(),),
    SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
    ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
    UserHomePage.routeName: (BuildContext context) => UserHomePage(),
    Courses2.routeName: (BuildContext context) => Courses2(),
    GrammarPage.routeName: (BuildContext context) => GrammarPage(),
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    ProfileEdit.routeName: (BuildContext context) => ProfileEdit(),
    LoginAuth.routeName: (BuildContext context) => LoginAuth(userRepository: UserRepository(),),

  };
}
