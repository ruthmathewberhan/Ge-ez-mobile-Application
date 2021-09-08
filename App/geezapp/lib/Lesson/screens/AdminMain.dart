import 'package:geezapp/Lesson/screens/admin2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/adminmain";
  
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    //bottomNavigationBar: buildBottomBar(),
    body: Admin(),
  );

}