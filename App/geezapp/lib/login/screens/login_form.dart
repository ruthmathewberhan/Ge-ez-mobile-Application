import 'package:geezapp/profile/signup/screens/components/background.dart';
import 'package:geezapp/profile/signup/screens/components/rounded_input_container.dart';
import 'package:geezapp/profile/signup/screens/signup.dart';

import '../bloc/login_bloc.dart';
import '../repository/login.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../style/theme.dart' as Style;

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
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
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFieldContainer(
                          child: TextFormField(
                            controller: _usernameController,
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
                            controller: _passwordController,
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
                            _onLoginButtonPressed();
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
                                "ግባ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                              style: TextStyle(
                                  color: Color(0xFFB77415A), fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("tapped");
                                Navigator.pushNamed(
                                    context, SignUpScreen.routeName);
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
        },
      ),
    );
  }
}
