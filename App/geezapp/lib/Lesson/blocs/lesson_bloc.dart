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
      } catch (_) {
        yield LessonOperationFailure();
      }
    }
  }
}
