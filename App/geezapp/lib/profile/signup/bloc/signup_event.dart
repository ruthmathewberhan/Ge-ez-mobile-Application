import 'package:equatable/equatable.dart';
import '../signup.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignupLoad extends SignupEvent {
  const SignupLoad();

  @override
  List<Object> get props => [];
}

class SignupCreate extends SignupEvent {
  final Signup user;

  const SignupCreate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Account Created {signup: $user}';
}

