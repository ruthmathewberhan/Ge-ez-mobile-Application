// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/profile/signup/bloc/signup_bloc.dart';
import 'package:geezapp/profile/signup/repository/signup.dart';
import 'package:geezapp/profile/signup/screens/signup.dart';
import 'package:geezapp/course/screens/home_screen.dart';
import 'package:geezapp/login/repository/login.dart';
import 'package:geezapp/profile/profile_screen/bloc/profile_screen_bloc.dart';
import 'package:geezapp/profile/profile_screen/data_provider/profile_screen.dart';
import 'package:geezapp/profile/profile_screen/repository/profile_screen.dart';
import 'package:geezapp/profile/signup/signup.dart';
import 'Auth/auth_bloc.dart';
import 'Auth/auth_event.dart';
import 'Auth/auth_state.dart';
import 'login/screens/login.dart';
import 'package:geezapp/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'course/screens/UserHomePage.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  Bloc.observer = SimpleBlocDelegate();

  final userRepository = UserRepository();
  final signupRepository = SignupRepository(dataProvider: SignupDataProvider());

  final profileScreenRepository =
      ProfileScreenRepository(dataProvider: ProfileScreenDataProvider());
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        },
      ),
      BlocProvider(
          create: (ctx) => ProfileScreenBloc(
              profileScreenRepository: profileScreenRepository)),
       BlocProvider(
          create: (ctx) => SignupBloc(
              signupRepository: signupRepository)),   
    ],
    child: MaterialApp(routes:AppRoute.routes,
    initialRoute: AppRoute.initialRoute, 
    ),

  ),

  );
}

