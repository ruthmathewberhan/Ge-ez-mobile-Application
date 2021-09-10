import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';
import 'package:geezapp/Lesson/blocs/lesson_event.dart';
import 'package:geezapp/Lesson/models/lesson.dart';

void main() => runApp(const CreateLessonApp());

/// This is the main application widget.
class CreateLessonApp extends StatelessWidget {
  static const String routeName = '/createlesson';
  const CreateLessonApp({Key? key}) : super(key: key);

  static const String _title = 'ንዑስ ርዕስ አዘጋጅ';
  static const primaryColor = const Color(0xFFD55555);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: const Text(_title),
        backgroundColor: primaryColor,
      ),
      body: CreateLesson(),
    );
  }
}

//final levelList = ['ደረጃ ፩', 'ደረጃ ፪', 'ደረጃ ፫'];

class CreateLesson extends StatefulWidget {
  CreateLesson({Key? key}) : super(key: key);

  @override
  _CreateLessonState createState() => _CreateLessonState();
}

class _CreateLessonState extends State<CreateLesson> {
  final _formkey = GlobalKey<FormState>();
  final Map<String, dynamic> _lesson = {};
  String levelIntial = '1';
  String courseIntial = '1';

  @override
  Widget build(BuildContext context) {
    this._lesson["level_id"] = 1;
    this._lesson["course_id"] = 1;
    return BlocBuilder<LessonBloc, LessonState>(
        builder: (ctx, lessonState) {
          if (lessonState is LessonOperationFailure) {
            return Center(child: Text("ትምህርቱን መጫን ኣልተቻለም"));
          }
          if (lessonState is LessonOperationSuccess) {
            return Center(child: Text("በትክክል ተፈጥሯል"));
          }
          return Form(
            key: _formkey,
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ንዑስ ርዕስ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.indigo[50],
                  ),
                  //height: 20,
                  child: TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'ንዑስ ርዕስ'),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'እባክዎ ንዑስ ርዕስ ያስገቡ';
                        }
                        return null;
                      },
                      onSaved: (val){
                       
                          this._lesson["lessonName"] = val;
                        
                      }),
                ),
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ደረጃ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(5.0),
                  width: 200,
                  child: DropdownButton<String>(
                    value: levelIntial,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 14,
                    elevation: 16,
                    isExpanded: true,
                    dropdownColor: Colors.indigo[50],
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        levelIntial = newValue!;
                        this._lesson["level_id"] = int.parse(newValue);
                      });
                    },
                    items: <String>['1', '2', '3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ኮርስ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(5.0),
                  width: 200,
                  child: DropdownButton<String>(
                    value: courseIntial,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 14,
                    elevation: 16,
                    isExpanded: true,
                    dropdownColor: Colors.indigo[50],
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        courseIntial = newValue!;
                        this._lesson["course_id"] = int.parse(newValue);
                      });
                    },
                    items: <String>['1', '2', '3', '4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ትምህርት',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.indigo[50],
                  ),
                  //height: 20,
                  child: TextFormField(
                      maxLines: 15,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'የትምህርቱ ሃተታ'),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'እባክዎ የትምህርቱን ሃተታ ያስገቡ';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          this._lesson["content"] = value;
                        });
                      }),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  height: 30,
                  child: ElevatedButton(
                      child: Text(
                        'አስገባ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        final form = _formkey.currentState;
                        if (form != null && form.validate()) {
                          form.save();
                          final LessonEvent event = LessonCreate(Lesson(
                              level_id: this._lesson["level_id"],
                              lessonName: this._lesson["lessonName"],
                              course_id: this._lesson["course_id"],
                              content: this._lesson["content"],
                              status: "pending",
                              teacher_id: 1));
                          BlocProvider.of<LessonBloc>(context).add(event);
                        }
                      }),
                ),
              ],
            ),
          );
        });
  }
}