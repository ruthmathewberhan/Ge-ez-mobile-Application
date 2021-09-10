import 'dart:convert';

import 'package:geezapp/Questions/models/models.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

// a data provider for question bloc
class QuestionDataProvider {
  static final _gedeup_Url =
      "http://127.0.0.1:5000/api/v1/questions"; // a variable for get, delete and update
  static final _get_Url = "/api/v1/question/choice";
  static final _post_Url = "/api/v1/question";
  //static final _getAll_Url = "/api/v1/questions";

  // post a question
  Future<Questions> createQuestion(Questions question) async {
    final http.Response response = await http.post(Uri.parse(_post_Url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "question": question.question,
          "level_id": question.level_id,
          "user_id": question.user_id,
          "status": question.status,
          "Question_id": question.Question_id,
          "choice_1": question.choice_1,
          "choice_2": question.choice_2,
          "choice_3": question.choice_3,
          "choice_4": question.choice_4,
          "Answer": question.answer
        }));

    if (response.statusCode == 201) {
      return Questions.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create a question");
    }
  }

  //  fetch by teacher's id
  Future<List<Questions>> fetchById(Questions quest, int Id) async {
    final response = await http.get(Uri.parse('$_gedeup_Url/$Id'));
    if (response.statusCode == 200) {
      final questions = jsonDecode(response.body) as List;
      return questions.map((c) => Questions.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch the questions");
    }
  }

  // fetch all new questions
  Future<List<Questions>> fetchStatusPending() async {
    final response = await http.get(Uri.parse('$_gedeup_Url/pending'));
    if (response.statusCode == 200) {
      final questions = jsonDecode(response.body) as List;
      return questions.map((c) => Questions.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch the questions");
    }
  }

  // fetch all of the questions (old)
  Future<List<Questions>> fetchStatusApproved() async {
    final response = await http.get(Uri.parse('$_gedeup_Url/approved'));
    if (response.statusCode == 200) {
      final questions = jsonDecode(response.body) as List;
      return questions.map((c) => Questions.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch the questions");
    }
  }

  // upadate a question by Id
  Future<Questions> updateQuestion(int id, Questions question) async {
    final response = await http.put(Uri.parse("$_gedeup_Url/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "question_id": id,
          "question": question.question,
          "level_id": question.level_id,
          "user_id": question.user_id,
          "status": question.status,
          "Question_id": question.Question_id,
          "choice_1": question.choice_1,
          "choice_2": question.choice_2,
          "choice_3": question.choice_3,
          "choice_4": question.choice_4,
          "Answer": question.answer
        }));

    if (response.statusCode == 200) {
      return Questions.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the question");
    }
  }

  // delete question by id
  Future<void> deleteQuestion(int id) async {
    final response = await http.delete(Uri.parse("$_gedeup_Url/$id"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete the question");
    }
  }
}
