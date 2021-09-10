import 'package:equatable/equatable.dart';
import '../signup.dart';

class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupLoading extends SignupState {}

class SignupLoadSuccess extends SignupState {
  final List<Signup> signup;

  SignupLoadSuccess([this.signup = const []]);

  @override
  List<Object> get props => [signup];
}

class SignupOperationFailure extends SignupState {}
