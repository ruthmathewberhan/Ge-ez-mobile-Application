import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/lesson_bloc.dart';
import 'package:geezapp/Lesson/blocs/lesson_event.dart';
import 'package:geezapp/Lesson/blocs/lesson_state.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = '/details';
  final textController = new TextEditingController();
  DetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFFCAB5BF),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<LessonBloc>(context).add(LessonLoad('pending'));
            Navigator.pop(context);
          },
        ),
        title: Text(''),
      ),
      body: BlocBuilder<LessonBloc, LessonState>(
        builder: (_, state) {
          if (state is LessonOperationFailure) {
            return Text('Could not do course operation');
          }
          if (state is LessonLoadSuccess) {
            textController.text = state.lesson.content;
            final String lessonContent = state.lesson.content;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: "$lessonContent",
                          hintStyle: TextStyle(fontSize: 30),
                          fillColor: Color(0xFFE0E0E0),
                          filled: true,
                        ),
                        maxLines: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              //margin: EdgeInsets.symmetric(horizontal: 100.0),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.green,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'ተቀበል',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.red,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'አትቀበል',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          print("here");
          return Container();
        },
      ),
    );
  }

  void moveToLastScreen() {
    //Navigator.pop(context);
  }
}
