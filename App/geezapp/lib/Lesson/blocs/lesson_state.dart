import 'package:geezapp/Lesson/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class LessonState extends Equatable {
  const LessonState();

  @override
  List<Object> get props => [];
}

class LessonLoading extends LessonState {}

class LessonOperationSuccess extends LessonState {
  final Iterable<Lesson> lessons;

  LessonOperationSuccess([this.lessons = const []]);

  @override
  List<Object> get props => [lessons];
}

class LessonOperationFailure extends LessonState {}

