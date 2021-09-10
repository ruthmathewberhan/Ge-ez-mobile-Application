import 'package:geezapp/Questions/models/models.dart';
import 'package:geezapp/Questions/data_providers/question_data_provider.dart';

class QuestionRepository {
  final QuestionDataProvider dataProvider;
  QuestionRepository(this.dataProvider);

  // create a question
  Future<Questions> create(Questions question) async {
    return this.dataProvider.createQuestion(question);
  }

  // fetch questions by Id
  Future<List<Questions>> fetch(Questions quest, int Id) async {
    return this.dataProvider.fetchById(quest, Id);
  }

  // fetch questions by status
  Future<List<Questions>> fetchNew() async {
    return this.dataProvider.fetchStatusPending();
  }

  // fetch questions by status
  Future<List<Questions>> fetchOld() async {
    return this.dataProvider.fetchStatusApproved();
  }

  // update questions
  Future<Questions> update(int id, Questions question) async {
    return this.dataProvider.updateQuestion(id, question);
  }

  // delete a question
  Future<void> delete(int id) async {
    this.dataProvider.deleteQuestion(id);
  }
}
