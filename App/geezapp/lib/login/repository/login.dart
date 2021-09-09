import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static String mainUrl = "http://localhost:5000/api/v1";
  var loginUrl = '$mainUrl/user/login';

  final FlutterSecureStorage storage = new FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'user_id');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'user_id', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'user_id');
    storage.deleteAll();
  }

  Future<String> login(String phone, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": phone,
      "password": password,
    });
     SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setString(
                                'email', response.data["email"]);
                            sharedPreferences.setString(
                                "user_id", response.data["user_id"]);

    return response.data["user_id"];
  }
}
