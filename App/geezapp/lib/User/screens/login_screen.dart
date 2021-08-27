import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/components/background.dart';
import 'package:geezapp/User/screens/components/round_button.dart';
import 'package:geezapp/User/screens/sign_up_screen.dart';

import 'components/rounded_input_container.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  final formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provides us total height and width of our screen
    return Scaffold(
      body: Background(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Text(
                      "ይግቡ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFFB77415A),
                          ),
                          hintText: "ኢሜል",
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xFFB77415A),
                          ),
                          hintText: "የይለፍ ቃል",
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 40)),
                  GestureDetector(
                    onTap: () {
                      final formValid = formKey.currentState?.validate();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Color(0xFFB77415A),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "ተመዝገብ",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  // RoundedButton(
                  //   text: "ግባ",
                  //   press: () {
                  //     //print("clicked");
                  //     final formValid = formKey.currentState?.validate();
                  //   },
                  // ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "መለያ ይልዎትም? ",
                        style:
                            TextStyle(color: Color(0xFFB77415A), fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("tapped");
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: Text(
                          "መለያ ይፍጠሩ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB77415A),
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
