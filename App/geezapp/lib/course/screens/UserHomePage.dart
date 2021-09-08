import 'package:flutter/material.dart';
import 'package:geezapp/course/my_flutter_app_icons.dart';
import 'package:geezapp/User/screens/profile_screen.dart';
import 'package:geezapp/course/screens/GrammarPage.dart';
import 'package:geezapp/course/screens/home_screen.dart';
import 'package:geezapp/enums.dart';

class UserHomePage extends StatefulWidget {
  static const String routeName = '/userhome';
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 90),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('ሰላም አሌክስ  ',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 1.5)),
                            Icon(MyFlutterApp.waving_hand_black_24dp)
                          ],
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(239, 222, 212, 1), //light brown
                      border:
                          Border.all(color: Color.fromRGBO(232, 231, 229, 0.5)),
                      borderRadius: BorderRadius.circular(10)),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      children: [
                        Text(
                          'ደረጃ አንድ',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
                            )),
                        Text('12/50 ትምህርቶች', style: TextStyle(fontSize: 20))
                      ],
                    )
                  ]),
                ),
                Row(children: [
                  Text('ተያያዥ ትምህርቶች ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 1.5))
                ]),
                Container(
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      border: Border(
                          top:
                              BorderSide(color: Color.fromRGBO(211, 211, 211, 1)),
                          bottom: BorderSide(
                              color: Color.fromRGBO(211, 211, 211, 1))),
                    ),
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, GrammarPage.routeName);
                          },
                          child: Container(
                              margin: EdgeInsets.all(15),
                              width: 125,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(205, 133, 63, 1)),
                              child: Align(
                                child: Text(
                                  'ወራት',
                                  style: TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, GrammarPage.routeName);
                          },
                          child: Container(
                            margin: EdgeInsets.all(15),
                            width: 125,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(205, 133, 63, 1)),
                            child: Align(
                                child: Text(
                              'ቁጥሮች',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, GrammarPage.routeName);
                          },
                          child: Container(
                            margin: EdgeInsets.all(15),
                            width: 125,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(205, 133, 63, 1)),
                            child: Align(
                                child: Text(
                              'ቀናት',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    )),
                Row(children: [
                  Text('ትምህርቶች ',
                      style: TextStyle(
                          fontSize: 25,
                          wordSpacing: 1.5,
                          fontWeight: FontWeight.bold))
                ]),
                Container(
                  height: size.height * 0.26,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                          height: 55,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(211, 211, 211, 1)))),
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, HomeScreen.routeName);
                                },
                                child: Container(
                                  child: Align(
                                    child: Text(
                                      '   መግቢያ',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      Container(
                          height: 55,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(211, 211, 211, 1)))),
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Align(
                                    child: Text(
                                      '   ፊደላት',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      Container(
                          height: 55,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(211, 211, 211, 1)))),
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Align(
                                    child: Text(
                                      '   ቃላት',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      Container(
                          height: 55,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(211, 211, 211, 1)))),
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, HomeScreen.routeName);
                                },
                                child: Container(
                                  child: Align(
                                    child: Text(
                                      '   መግቢያ',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      Container(
                          height: 55,
                          margin: EdgeInsets.only(top: 10, left: 5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(211, 211, 211, 1)))),
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Align(
                                    child: Text(
                                      '   መግቢያ',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
