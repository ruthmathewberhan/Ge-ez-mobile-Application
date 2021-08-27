import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/components/background.dart';
import 'package:geezapp/User/screens/components/round_button.dart';
import 'package:geezapp/User/screens/sign_up_screen.dart';
import 'components/rounded_input_container.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provides us total height and width of our screen
    return Scaffold(
      body: Background(
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            RoundedInputContainer(
              hintText: "ኢሜል",
              icon: Icons.person,
              textObscure: false,
            ),
            SizedBox(
              height: 15,
            ),
            RoundedInputContainer(
              hintText: "የይለፍ ቃል",
              icon: Icons.lock,
              textObscure: true,
            ),
            Padding(padding: EdgeInsets.only(bottom: 40)),
            RoundedButton(
              text: "ግባ",
              press: () {
                //print("clicked");
              },
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "መለያ ይልዎትም? ",
                  style: TextStyle(color: Color(0xFFB77415A), fontSize: 16),
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
    );
  }
}

