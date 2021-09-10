import 'package:geezapp/Questions/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionLoading extends QuestionState {}

class QuetionOperationSuccess extends QuestionState {
  final Iterable<Questions> question;

  QuetionOperationSuccess([this.question = const []]);

  @override
  List<Object> get props => [question];
}

class QuestionOperationFailure extends QuestionState {}
