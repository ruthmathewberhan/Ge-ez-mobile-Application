// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/lesson_bloc.dart';
import 'package:geezapp/Lesson/data_providers/lesson-data-provider.dart';
import 'package:geezapp/Lesson/repository/lesson-repository.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';
import 'package:geezapp/User/screens/welcome_screen.dart';
import 'package:geezapp/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'course/screens/UserHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');

  final lessonRepository = LessonRepository(
    LessonDataProvider(),
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (ctx) => LessonBloc(lessonRepository: lessonRepository)
      )
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoute.routes,
        initialRoute:
            email == null ? AppRoute.initialRoute : UserHomePage.routeName),
  ));
}
