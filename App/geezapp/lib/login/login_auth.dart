import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Auth/auth_bloc.dart';
import 'package:geezapp/Auth/auth_state.dart';
import 'package:geezapp/course/screens/UserHomePage.dart';
import 'package:geezapp/login/repository/login.dart';
import 'package:geezapp/login/screens/login.dart';
import 'package:geezapp/main.dart';
import 'package:flutter/material.dart';
import 'package:geezapp/login/style/theme.dart' as Style;

class LoginAuth extends StatelessWidget {
  static const routeName = '/loginauth';
  final UserRepository userRepository;

  LoginAuth({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   locale: const Locale('mn', 'MN'),
    //   theme: ThemeData(
    //     fontFamily: 'Rubik',
    //     primarySwatch: Colors.blueGrey,
    //   ),
    //   home:
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationAuthenticated) {
        return UserHomePage();
      }
      if (state is AuthenticationUnauthenticated) {
        return LoginScreen(userRepository: userRepository);
      }
      if (state is AuthenticationLoading) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Style.Colors.mainColor),
                    strokeWidth: 4.0,
                  ),
                )
              ],
            ),
          ),
        );
      }
      return Scaffold(
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
                  strokeWidth: 4.0,
                ),
              )
            ],
          ),
        ),
      );
    });
    //   ),
    // );
  }
}
