import 'package:flutter/material.dart';
import 'package:geezapp/Lesson/screens/AdminMain.dart';

class AdminLoginScreen extends StatelessWidget {
  static const String routeName = "/adminlogin";

  AdminLoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final adminformKey = GlobalKey<FormState>();

  final adminEmail = 'admin@mail.com';
  final adminPass = '12345678';

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: adminformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "አድሚን",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "ኢሜይል",
                    border: inputBorder,
                  ),
                  validator: (String? email) {
                    if (!email!.contains('@') || email != adminEmail) {
                      return "ልክ ያልሆነ አሜል";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "የይለፍ ቃል",
                    border: inputBorder,
                  ),
                  validator: (String? password) {
                    if (password!.length < 8) {
                      return "የይለፍ ቃል አጥሯል";
                    }
                    else if (password != adminPass) {
                      return "የተሳሳተ የይለፍ ቃል";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    final success = adminformKey.currentState!.validate();

                    if (!success) {
                      return;
                    }

                    final email = emailController.text;
                    final password = passwordController.text;
                    print("email is $email and password is $password");

                    if (email == adminEmail && password == adminPass) {
                      Navigator.pushNamed(context, MainPage.routeName);
                    }
                  },
                  child: Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFB77415A),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Center(
                      child: Text(
                        "ይግቡ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
