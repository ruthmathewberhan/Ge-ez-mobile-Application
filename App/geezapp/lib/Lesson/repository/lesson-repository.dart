import 'package:geezapp/Lesson/models/models.dart';
import 'package:geezapp/Lesson/data_providers/lesson-data-provider.dart';

class LessonRepository {
  final LessonDataProvider dataProvider;
  LessonRepository(this.dataProvider);

  Future<List<Lesson>> fetchLessons() async {
    return this.dataProvider.fetchLessons();
  }

  Future<Lesson> create(Lesson lesson) async {
    return this.dataProvider.create(lesson);
  }
}
