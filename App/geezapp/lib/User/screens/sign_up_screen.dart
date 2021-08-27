import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/login_screen.dart';
import 'components/background.dart';
import 'components/round_button.dart';
import 'components/rounded_input_container.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
            ),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Text(
                "ተመዝገብ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            RoundedInputContainer(
              hintText: "ስም",
              icon: Icons.person_sharp,
              textObscure: false,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputContainer(
              hintText: "የአባት ስም",
              icon: Icons.person_rounded,
              textObscure: false,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputContainer(
              hintText: "ኢሜል",
              icon: Icons.person,
              textObscure: false,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputContainer(
              hintText: "የይለፍ ቃል",
              icon: Icons.lock,
              textObscure: true,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RadioUType(),
            RoundedButton(
              text: "ተመዝገብ",
              press: () {
                //print("clicked");
              },
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "መለያ አልዎት? ",
                  style: TextStyle(color: Color(0xFFB77415A), fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    print("tapped");
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Text(
                    "ይግቡ",
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

class RadioUType extends StatefulWidget {
  const RadioUType({Key? key}) : super(key: key);

  @override
  _RadioUTypeState createState() => _RadioUTypeState();
}

class _RadioUTypeState extends State<RadioUType> {
  //Default Radio Button Selected
  String radioButtonItem = 'teacher';
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: 1,
          activeColor: Color(0xFFB77415A),
          groupValue: id,
          onChanged: (val) {
            setState(
              () {
                radioButtonItem = 'teacher';
                id = 1;
              },
            );
          },
        ),
        Text('አስተማሪ', style: new TextStyle(fontSize: 17.0)),
        Padding(padding: EdgeInsets.only(right: 25)),
        Radio(
          value: 2,
          activeColor: Color(0xFFB77415A),
          groupValue: id,
          onChanged: (val) {
            setState(
              () {
                radioButtonItem = 'student';
                id = 2;
              },
            );
          },
        ),
        Text('ተማሪ', style: new TextStyle(fontSize: 17.0))
      ],
    );
  }
}
