// @dart=2.9
import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/login_screen.dart';
import 'package:geezapp/course/screens/GrammarPage.dart';
import 'package:geezapp/course/screens/UserHomePage.dart';
import 'package:geezapp/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute.routes,
      initialRoute: AppRoute.initialRoute,
    );
  }
}
