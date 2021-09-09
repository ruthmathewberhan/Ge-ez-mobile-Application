import 'package:http/http.dart' as http;
import 'package:geezapp/Lesson/models/models.dart';
import 'dart:convert';

class LessonDataProvider {
  static final String _baseUrl = "http://127.0.0.1:5000/api/v1";

  //get list of new lessons
  Future<List<Lesson>> fetchLessons(String status) async {
    final response = await http.get(Uri.parse('$_baseUrl/lessons/$status'));

    if (response.statusCode == 200) {
      final lessons = jsonDecode(response.body) as List;
      return lessons.map((c) => Lesson.fromJson(c)).toList();
    } else {
      throw Exception("Couldn't fetch lessons");
    }
  }

  Future<Lesson> update(int id, Lesson lesson) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/lessons/$id"),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(
        {"content": lesson.content},
      ),
    );

    if (response.statusCode == 200) {
      return Lesson.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the lesson");
    }
  }
}
