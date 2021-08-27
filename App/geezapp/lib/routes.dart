import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/profile_screen.dart';
import 'package:geezapp/User/screens/sign_up_screen.dart';
import 'package:geezapp/User/screens/welcome_screen.dart';
import 'package:geezapp/User/screens/login_screen.dart';

class AppRoute  {
  static const initialRoute = SignUpScreen.routeName;
  
  static final routes = {
    WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
    ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
  };
}
