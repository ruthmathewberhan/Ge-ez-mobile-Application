import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xFFB77415A),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 140, bottom: 20),
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Center(
                  child: Image.asset("assets/images/home.png"),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "እንኳን ወደ ፊደል መጡ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "ማስተማር ቀላል ይሆናል",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 120, right: 120, top: 10, bottom: 100),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFBEFDED4),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        "ጀምር",
                        style: TextStyle(
                          color: Color(0xFFB77415A),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
