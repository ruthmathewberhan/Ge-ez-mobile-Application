import 'package:geezapp/Lesson/models/models.dart';
import 'package:geezapp/Lesson/data_providers/lesson-data-provider.dart';

class LessonRepository {
  final LessonDataProvider dataProvider;
  LessonRepository(this.dataProvider);

  Future<List<Lesson>> fetchLessons(String status) async {
    return this.dataProvider.fetchLessons(status);
  }

  Future<Lesson> updateLesson(int id, Lesson lesson) async {
    return this.dataProvider.update(id, lesson);
  }
}
