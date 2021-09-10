import 'package:geezapp/Questions/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class QuestionEvents extends Equatable {
  const QuestionEvents();
}

// event for creating a quetion
class CreateQuestion extends QuestionEvents {
  final Questions question;

  const CreateQuestion(this.question);

  @override
  List<Object> get props => [question];

  String toString() => 'Question have been created{Question: $question}';
}

// event for loading question from specfic teacher
class LoadQuestionsById extends QuestionEvents {
  final Questions question;

  const LoadQuestionsById(this.question);

  @override
  List<Object> get props => [question];
}

// event for loading new question
class LoadNewQuestions extends QuestionEvents {
  const LoadNewQuestions();

  @override
  List<Object> get props => [];
}

// event for loading old question
class LoadOldQuestions extends QuestionEvents {
  const LoadOldQuestions();

  @override
  List<Object> get props => [];
}

// event for updating question
class UpdateQuestion extends QuestionEvents {
  final Questions question;

  const UpdateQuestion(this.question);

  @override
  List<Object> get props => [question];

  String toString() => 'Question have been updated{Question: $question}';
}

// event for deleting question
class DeleteQuestion extends QuestionEvents {
  final int Id;

  const DeleteQuestion(this.Id);

  @override
  List<Object> get props => [Id];

  toString() => 'Question have been deleted{Question Id: $Id}';
}
