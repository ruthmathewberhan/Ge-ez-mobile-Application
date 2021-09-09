import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class ProfileScreenDataProvider {
  final _baseUrl = 'http://127.0.0.1:5000/api/v1';
  //final http.Client httpClient;

  Future<List<ProfileScreen>> getProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('user_id')!;
    final response = await http.get('$_baseUrl/user/profile/$id');

    if (response.statusCode == 200) {
      final profiles = jsonDecode(response.body) as List;
      return profiles.map((profileScreen) => ProfileScreen.fromJson(profileScreen)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('user_id')!;
    final http.Response response = await http.delete(
      '$_baseUrl/user/profile/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete profile.');
    }
  }
}
