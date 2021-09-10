import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/login/screens/login.dart';
import 'package:geezapp/course/screens/UserHomePage.dart';
import 'package:geezapp/profile/signup/bloc/signup_bloc.dart';
import 'package:geezapp/profile/signup/bloc/signup_event.dart';
import 'package:geezapp/profile/signup/bloc/signup_state.dart';
import 'package:geezapp/profile/signup/models/signup.dart';
import 'package:get/get.dart';
import 'components/background.dart';
import 'components/round_button.dart';
import 'components/rounded_input_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String radioButtonItem = 'teacher';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signup';

  final formKey = GlobalKey<FormState>();

  SignUpScreen({Key? key}) : super(key: key);

  // final url = 'http://192.168.1.248:5000/api/v1';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Background(
          child: Center(
            child: SingleChildScrollView(
              child: Center(
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
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    BlocConsumer<SignupBloc, SignupState>(
                        listener: (context, state) {
                      if (state is SignupOperationFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Signup failed."),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      if (state is SignupLoadSuccess){
                         Navigator.pop(context);
                      }
                    }, builder: (ctx, state) {
                      return Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFieldContainer(
                              child: TextFormField(
                                controller: firstNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person_sharp,
                                      color: Color(0xFFB77415A),
                                    ),
                                    hintText: "ስም",
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
                              height: size.height * 0.03,
                            ),
                            TextFieldContainer(
                              child: TextFormField(
                                controller: secondNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person_rounded,
                                      color: Color(0xFFB77415A),
                                    ),
                                    hintText: "የአባት ስም",
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
                              height: size.height * 0.03,
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
                              height: size.height * 0.03,
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
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            RadioUType(),
                            GestureDetector(
                              onTap: () {
                                final form = formKey.currentState;
                                if (form != null && form.validate()) {
                                  form.save();
                                  final SignupEvent event = SignupCreate(
                                    Signup(
                                      email: this.emailController.text,
                                      password: this.passwordController.text,
                                      firstName: this.firstNameController.text,
                                      secondName:
                                          this.secondNameController.text,
                                      userType: radioButtonItem,
                                      photo: "ww.google.com",
                                    ),
                                  );
                                  BlocProvider.of<SignupBloc>(context)
                                      .add(event);
                                  
                                }
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            // RoundedButton(
                            //   text: "ተመዝገብ",
                            //   press: () {
                            //     final formValid = formKey.currentState?.validate();
                            //   },
                            // ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "መለያ አልዎት? ",
                          style: TextStyle(
                              color: Color(0xFFB77415A), fontSize: 16),
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
            ),
          ),
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
