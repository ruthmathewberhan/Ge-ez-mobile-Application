import 'package:geezapp/Questions/Repository/question_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'question_events.dart';
import 'question_states.dart';

class QuestionBloc extends Bloc<QuestionEvents, QuestionState> {
  final QuestionRepository questionRepository;

  QuestionBloc({required this.questionRepository}) : super(QuestionLoading());

  @override
  Stream<QuestionState> mapEventToState(QuestionEvents event) async* {
    if (event is LoadQuestionsById) {
      yield QuestionLoading();
      try {
        final questions = await questionRepository.fetch(
            event.question, event.question.user_id);
        yield QuetionOperationSuccess(questions);
      } catch (_) {
        yield QuestionOperationFailure();
      }
    }

    if (event is LoadNewQuestions) {
      yield QuestionLoading();
      try {
        final questions = await questionRepository.fetchNew();
        yield QuetionOperationSuccess(questions);
      } catch (_) {
        yield QuestionOperationFailure();
      }
    }

    if (event is LoadOldQuestions) {
      yield QuestionLoading();
      try {
        final questions = await questionRepository.fetchOld();
        yield QuetionOperationSuccess(questions);
      } catch (_) {
        yield QuestionOperationFailure();
      }
    }

    if (event is CreateQuestion) {
      try {
        await questionRepository.create(event.question);
        final questions = await questionRepository.fetchNew();
        yield QuetionOperationSuccess(questions);
      } catch (_) {
        yield QuestionOperationFailure();
      }
    }

    if (event is UpdateQuestion) {
      try {
        await questionRepository.update(
            event.question.question_id, event.question);
        final questions = await questionRepository.fetchOld();
        yield QuetionOperationSuccess(questions);
      } catch (_) {
        yield QuestionOperationFailure();
      }
    }

    if (event is DeleteQuestion) {
      try {
        await questionRepository.delete(event.Id);
        final questions = await questionRepository.fetchOld();
        yield QuetionOperationSuccess(questions);
      } catch (_) {
        yield QuestionOperationFailure();
      }
    }
  }
}
