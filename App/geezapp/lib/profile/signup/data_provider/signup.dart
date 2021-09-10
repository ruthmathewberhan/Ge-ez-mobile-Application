import 'dart:convert';

import 'package:meta/meta.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class SignupDataProvider {
  final _baseUrl = 'http://localhost:5000/api/v1';

  SignupDataProvider();

  Future<Signup> createSignup(Signup signup) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': signup.email,
        'password': signup.password,
        'firstName': signup.firstName,
        'secondName': signup.secondName,
        'userType': signup.userType,
        'photo': signup.photo
      }),
    );

    if (response.statusCode == 200) {
      return Signup.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create account.');
    }
  }
  Future<List<Signup>> fetchAll() async {
    final response = await http.get(Uri.parse('$_baseUrl/user/all'));
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((c) => Signup.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch users");
    }
  }
}
