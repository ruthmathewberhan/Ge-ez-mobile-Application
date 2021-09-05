import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);
  static const String routeName = '/edit';
  @override
  _StateProfileEdit createState() => _StateProfileEdit();
}

class _StateProfileEdit extends State<ProfileEdit> {
  late Future<Album> futureAlbum;
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final passwordController = TextEditingController();

  String id = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString('user_id')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Profile Edit Page'),
            backgroundColor: Color(0xFFB77415A)),
        body: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              emailController.text = snapshot.data!.email;
              firstNameController.text = snapshot.data!.firstName;
              secondNameController.text = snapshot.data!.secondName;
              passwordController.text = snapshot.data!.password;
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          hintText: 'first name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: secondNameController,
                        decoration: InputDecoration(
                            hintText: 'second name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: 'password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            futureAlbum = updateAlbum(
                                firstNameController.text,
                                secondNameController.text,
                                emailController.text,
                                passwordController.text,
                                id);
                          });
                        },
                        child: Text('Update'),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFB77415A),
                            fixedSize: Size(350, 50),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<Album> fetchAlbum() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String id = preferences.getString('user_id')!;
  final response = await http
      .get(Uri.parse('http://127.0.0.1:5000/api/v1/user/profile/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> updateAlbum(String firstName, String secondName, String email,
    String password, String id) async {
  final response = await http.patch(
    Uri.parse('http://127.0.0.1:5000/api/v1/user/profile/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}

class Album {
  final String email;
  final String firstName;
  final String secondName;
  final String password;
  final String userType;
  final String photo;

  Album(
      {required this.email,
      required this.firstName,
      required this.secondName,
      required this.password,
      required this.userType,
      required this.photo});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        email: json['email'] ?? "",
        password: json['password'] ?? "",
        firstName: json['firstName'] ?? "",
        secondName: json['secondName'] ?? "",
        userType: json['userType'] ?? "",
        photo: json['photo'] ?? "");
  }
}
