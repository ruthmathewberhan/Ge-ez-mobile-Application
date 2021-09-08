import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';
import 'package:geezapp/Lesson/models/models.dart';
import 'package:geezapp/Lesson/screens/AdminMain.dart';
import 'package:geezapp/Lesson/screens/details.dart';
import 'package:geezapp/Lesson/screens/details_page_lesson.dart';
import 'package:geezapp/Lesson/screens/details_page_exam.dart';

class Admin extends StatefulWidget {
  @override
  _SimpleAppBarPageState createState() => _SimpleAppBarPageState();
}

class _SimpleAppBarPageState extends State<Admin> {
  late var lessonList;
  late var questionList;

  @override
  Widget build(BuildContext context) {
    final lessonBloc = BlocProvider.of<LessonBloc>(context);

    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("አድሚን"),

          //centerTitle: true,

          //backgroundColor: Colors.purple,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Color(0xFFCAB5BF),
            ),
          ),
          bottom: TabBar(
            //isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(text: 'ዝርዝር'),
              Tab(text: 'ትምህርቶች'),
              Tab(text: 'ፈተና'),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<LessonBloc, LessonState>(
              builder: (_, lessonState) {
                if (lessonState is LessonLoading) {
                  return CircularProgressIndicator();
                }
                if (lessonState is LessonOperationFailure) {
                  return Text("loading lessons failed");
                }
                if (lessonState is LessonOperationSuccess) {
                  final lessons = lessonState.lessons;
                  return ListView.builder(
                    itemCount: lessons.length,
                    itemBuilder: (_, int index) {
                      return Center(
                        child: GestureDetector(
                          onTap:  () {
                            Navigator.pushNamed(
                                    context,
                                    DetailPage.routeName
                                  );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.all(10.0),
                            child: ListTile(
                                title: Text('${lessons.elementAt(index).lessonName}'),
                                subtitle: Text('የአስተማሪ ስም : ${lessons.elementAt(index).teacher_name}'),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_forward),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      DetailPage.routeName
                                    );
                                  },
                                )),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
            ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text('የትምህርቱ ርእስ'),
                        trailing: Icon(
                          Icons.delete,
                          color: Color(0xFFB751623),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPagelesson(index)));
                        },
                      ),
                    ),
                  );
                },
                itemCount: 10),
            ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Icon(Icons.person_outline),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPageExam(index)));
                        },
                        title: Text('ፈተና'),
                      ),
                    ),
                  );
                },
                itemCount: 10),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}



// //get list of new questions
// Future<List<Question>> fetchQuestions() async {
//   final response = await http
//       .get(Uri.parse('http://127.0.0.1:5000/api/v1/questions/pending'));

//   if (response.statusCode == 200) {
//     final questions = jsonDecode(response.body) as List;
//     return questions.map((c) => Question.fromJson(c)).toList();
//   } else {
//     throw Exception("Couldn't fetch lessons");
//   }
// }


// class Question {
//   final int question_id;
//   final String question;
//   final int level_id;
//   final int user_id;
//   final String status;

//   Question(
//       {required this.question_id,
//       required this.question,
//       required this.level_id,
//       required this.user_id,
//       required this.status});

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//         question_id: json['question_id'],
//         question: json['question'],
//         level_id: json['level_id'],
//         user_id: json['user_id'],
//         status: json['status']);
//   }
// }
