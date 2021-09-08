import 'package:equatable/equatable.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();
}

class LessonLoad extends LessonEvent {
  const LessonLoad();

  @override
  List<Object?> get props => [];
  
}
