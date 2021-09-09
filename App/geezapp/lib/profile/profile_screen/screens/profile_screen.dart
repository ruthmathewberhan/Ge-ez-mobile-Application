import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Auth/auth_bloc.dart';
import 'package:geezapp/Auth/auth_event.dart';
import 'package:geezapp/login/screens/login.dart';
import 'package:geezapp/User/screens/profile_edit.dart';
import 'package:geezapp/profile/signup/screens/signup.dart';
import 'package:geezapp/course/screens/Courses2.dart';
import 'package:geezapp/course/screens/UserHomePage.dart';
import 'package:geezapp/enums.dart';
import 'package:geezapp/login/repository/login.dart';
import 'package:geezapp/main.dart';
import 'package:geezapp/profile/profile_screen/bloc/profile_screen_bloc.dart';
import 'package:geezapp/profile/profile_screen/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  // final MenuState selectedMenu;

  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  @override
  _StateProfileScreen createState() {
    return _StateProfileScreen();
  }
}

class _StateProfileScreen extends State<ProfileScreen> {
  late Future<Album> _futureAlbum;
  String email = "";
  String id = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
      id = preferences.getString('user_id')!;
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    preferences.remove('user_id');
  }

  @override
  void initState() {
    super.initState();
    getEmail();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: Colors.black54),
          elevation: 0,
          title: Center(
            child: Text(
              "My Profile",
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ),
          backgroundColor: Colors.transparent),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFBCD9C78),
                      backgroundImage: AssetImage("assets/images/nw.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -13,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(40)),
                      height: 46,
                      width: 47,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[200],
                          shape: CircleBorder(),
                          side: BorderSide(color: Colors.white),
                        ),
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.only(left: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60)),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "ሙሉ ስም",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, top: 10),
            width: double.infinity,
            child: Text(
              "Achievements",
              style: TextStyle(fontSize: 24, color: Colors.grey[700]),
            ),
          ),
          Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFA87E91),
                          Color(0xFF9E5579),
                          Color(0xFFB9889F)
                        ])),
                margin: EdgeInsets.only(left: 20, top: 10),
                width: 90,
                height: 30,
              ),
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFF5F6F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEdit()),
                );
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Edit Account",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFF5F6F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                setState(() {
                  final profileScreenBloc =
                      BlocProvider.of<ProfileScreenBloc>(context);
                  profileScreenBloc.add(ProfileScreenDelete());
                });
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
                logOut(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Delete Account",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFF5F6F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
                logOut(context);
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Expanded(
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key, required this.selectedMenu}) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, UserHomePage.routeName);
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    color: MenuState.home == selectedMenu
                        ? Color(0xFFB77415A)
                        : Colors.grey,
                    size: 35,
                  ),
                ),
                Text(
                  'መነሻ',
                  style: TextStyle(
                    color: MenuState.home == selectedMenu
                        ? Color(0xFFB77415A)
                        : Colors.grey,
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Courses2.routeName);
                  },
                  icon: Icon(
                    Icons.play_lesson_outlined,
                    color: MenuState.lessons == selectedMenu
                        ? Color(0xFFB77415A)
                        : Colors.grey,
                    size: 35,
                  ),
                ),
                Text(
                  'ትምህርቶች',
                  style: TextStyle(
                    color: MenuState.lessons == selectedMenu
                        ? Color(0xFFB77415A)
                        : Colors.grey,
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new ProfileScreen()));
                  },
                  icon: Icon(
                    Icons.person_outline,
                    color: MenuState.profile == selectedMenu
                        ? Color(0xFFB77415A)
                        : Colors.grey,
                    size: 35,
                  ),
                ),
                Text(
                  'መለያ',
                  style: TextStyle(
                    color: MenuState.profile == selectedMenu
                        ? Color(0xFFB77415A)
                        : Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
