import 'package:flutter/material.dart';
import 'package:geezapp/User/screens/components/background.dart';
import 'package:geezapp/User/screens/sign_up_screen.dart';
import 'package:geezapp/course/screens/UserHomePage.dart';
import 'components/rounded_input_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  @override
  _StateLoginScreen createState() => _StateLoginScreen();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();
final url = 'http://localhost:5000/api/v1';
var loggedIn = false;
var currentUser;

class _StateLoginScreen extends State<LoginScreen> {
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
                      controller: emailController,
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
                      controller: passwordController,
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
                      Posts post = Posts(
                          email: emailController.text,
                          password: passwordController.text);
                      createPost(url, body: post.toMap()).then((value) {
                        if (value['message'] == 'login') {
                          print('logged in');
                          loggedIn = true;
                          currentUser = value;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHomePage()),
                          );
                        } else {
                          print('not logged in');
                        }
                      });
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

Future createPost(String url, {required Map body}) async {
  return http
      .post(Uri.parse(url + "/user/login"),
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(body))
      .then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    // print("Message returned: " + json.decode(response.body)['message']);
    // return Posts.fromJson(json.decode(response.body));
    if (json.decode(response.body)['message'] == 'login') {
      print("login");
    }

    return json.decode(response.body);
  });
}

class Posts {
  final String email;
  final String password;

  Posts({required this.email, required this.password});

  factory Posts.fromJson(Map json) {
    return Posts(email: json['email'] ?? "", password: json['password'] ?? "");
  }

  Map<String, String> toMap() {
    var map = new Map<String, String>();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}
