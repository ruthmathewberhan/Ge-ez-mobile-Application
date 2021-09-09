import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/auth.dart';
import '../../login/repository/login.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        if (token == "") {
          print("token is empty");
          yield LoginFailure(error: "incorect username or password");
        } else {
          authenticationBloc.add(LoggedIn(token: token));
          //  SharedPreferences sharedPreferences =
          //                       await SharedPreferences.getInstance();
          //                   sharedPreferences.setString(
          //                       'email', ['email'].toString());
          //                   sharedPreferences.setString(
          //                       "user_id", token);

          yield LoginInitial();
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
