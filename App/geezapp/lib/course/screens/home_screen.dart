import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 60),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/left_top.png',
                            ),
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                )
              ]),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/right_top.png'),
                      fit: BoxFit.fill),
                ),
              ),
            ]),
        Container(
          height: 400,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              '''44 24 I am trying to achieve a very common behavior nowadays which is to have a horizontal List within another widget that is at the same time scrollable. Think something like the home screen of the IMDb app: enter image description here So I want to have a widget that scrolls vertically with few items on them. At the top of it, there should be a horizontal ListView, followed up with some items called motivationCard. There are some headers in between the list and the cards as well.
I got something like this on my Widget:44 24 I am trying to achieve a very common behavior nowadays which is to have a horizontal List within another widget that is at the same time scrollable. Think something like the home screen of the IMDb app: enter image description here So I want to have a widget that scrolls vertically with few items on them. At the top of it, there should be a horizontal ListView, followed up with some items called motivationCard. There are some headers in between the list and the cards as well.
I got something like this on my Widget:44 24 I am trying to achieve a very common behavior nowadays which is to have a horizontal List within another widget that is at the same time scrollable. Think something like the home screen of the IMDb app: enter image description here So I want to have a widget that scrolls vertically with few items on them. At the top of it, there should be a horizontal ListView, followed up with some items called motivationCard. There are some headers in between the list and the cards as well.
I got something like this on my Widget:''',
              style: TextStyle(fontSize: 23, height: 1.2),
            ),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text('ተመለስ'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    primary: Colors.orange),
              )),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('ቀጣይ'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: Colors.orange),
                ),
              ),
            ]),
      ],
    )));
  }
}
