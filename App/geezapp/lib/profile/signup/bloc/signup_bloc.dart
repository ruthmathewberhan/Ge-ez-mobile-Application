import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../signup.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepository signupRepository;

  SignupBloc({required this.signupRepository})
      : assert(SignupRepository != null),
        super(SignupLoading());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupLoad) {
      yield SignupLoading();
      try {
        final courses = await signupRepository.fetchAll();
        yield SignupLoadSuccess(courses);
      } catch (_) {
        yield SignupOperationFailure();
      }
    }

    if (event is SignupCreate) {
      try {
        bool emailFound = false;
        final signup = await signupRepository.fetchAll();
        for (int i = 0; i < signup.length; i++) {
          if (event.user.email == signup[i].email) {
            emailFound = true;
            print("email found");
          }
        }
        if (emailFound) {
          yield SignupOperationFailure();
        } else {
          await signupRepository.createSignup(event.user);
          yield SignupLoadSuccess(signup);
        }
      } catch (_) {
        yield SignupOperationFailure();
      }
    }
  }
}
