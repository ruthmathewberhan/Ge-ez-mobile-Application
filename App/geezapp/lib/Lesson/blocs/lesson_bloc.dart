import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';
import 'package:geezapp/Lesson/repository/lesson-repository.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository lessonRepository;

  LessonBloc({required this.lessonRepository}) : super(LessonLoading());

  @override
  Stream<LessonState> mapEventToState(LessonEvent event) async* {
    if (event is LessonLoad) {
      yield LessonLoading();
      try {
        final lessons = await lessonRepository.fetchLessons();
        yield LessonOperationSuccess(lessons);
      } catch (error) {
        print(error);
        yield LessonOperationFailure();
      }
    }

    if (event is LessonCreate) {
      yield LessonLoading();
      try {
        await lessonRepository.create(event.lesson);
        final lessons = await lessonRepository.fetchLessons();
        yield LessonOperationSuccess(lessons);
        await Future.delayed(Duration(seconds: 3));
        yield LessonLoading();
      } catch (error) {
        print(error);
        yield LessonOperationFailure();
        await Future.delayed(Duration(seconds: 3));
        yield LessonLoading();
      }
    }
  }
}
