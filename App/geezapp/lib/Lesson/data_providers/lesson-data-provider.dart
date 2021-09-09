import 'package:http/http.dart' as http;
import 'package:geezapp/Lesson/models/models.dart';
import 'dart:convert';

class LessonDataProvider {
  static final String _baseUrl = "http://127.0.0.1:5000/api/v1";

  //get list of new lessons
  Future<List<Lesson>> fetchLessons() async {
    final response = await http.get(Uri.parse('$_baseUrl/lessons/pending'));

    if (response.statusCode == 200) {
      final lessons = jsonDecode(response.body) as List;
      return lessons.map((c) => Lesson.fromJson(c)).toList();
    } else {
      throw Exception("Couldn't fetch lessons");
    }
  }

  Future<Lesson> create(Lesson lesson) async {
    print(lesson.lessonName);
    final http.Response response =
        await http.post(Uri.parse('$_baseUrl/lesson'),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              'lessonName': lesson.lessonName,
              'level_id': lesson.level_id,
              'course_id': lesson.course_id,
              'content': lesson.content,
              'status': lesson.status,
              'teacher_id': lesson.teacher_id
            }));
    if (response.statusCode == 201) {
      return Lesson.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create lesson");
    }
  }
}
