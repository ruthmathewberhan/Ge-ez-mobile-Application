// @dart=2.9
import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/login_screen.dart';
import 'package:geezapp/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'course/screens/UserHomePage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
       home: email ==null? LoginScreen(): UserHomePage()));
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
