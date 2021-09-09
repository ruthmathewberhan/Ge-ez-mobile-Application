import 'package:equatable/equatable.dart';
import 'package:geezapp/Lesson/models/lesson.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();
}

class LessonLoad extends LessonEvent {
  const LessonLoad();

  @override
  List<Object?> get props => [];
}

class LessonCreate extends LessonEvent {
  final Lesson lesson;

  const LessonCreate(this.lesson);
   
   @override
  List<Object> get props => [lesson];

  @override
  String toString() => 'lesson Created {lesson: $lesson}';
}
   

