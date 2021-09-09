import 'package:equatable/equatable.dart';
import 'package:geezapp/Lesson/models/lesson.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();
}

class LessonLoad extends LessonEvent {
  final String status;
  const LessonLoad(this.status);

  @override
  List<Object?> get props => [this.status];
}

class LoadLessonContent extends LessonEvent {
  final Lesson lesson;
  LoadLessonContent(this.lesson);

  @override
  List<Object?> get props => [this.lesson];
}

class LessonUpdate extends LessonEvent {
  final Lesson lesson;

  const LessonUpdate(this.lesson);

  @override
  List<Object> get props => [lesson];

  @override
  String toString() => 'Lesson Updated {lesson: $lesson}';
}