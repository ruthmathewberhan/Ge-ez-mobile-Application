import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = ' አዘጋጅ';
  static const primaryColor = const Color(0xFFD55555);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: const Text(_title),
          backgroundColor: primaryColor,
        ),
        body: Create(),
      ),
    );
  }
}

class Create extends StatelessWidget {
  const Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          //onTap: createLesson(),
          child: Container(
            height: 200,
            width: 400,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.amber[300],
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    right: 20,
                    child:
                        Icon(Icons.topic, size: 90, color: Colors.grey[300])),
                Positioned(
                    bottom: 50,
                    right: 100,
                    child: Text(
                      'ንዑስ ርዕስ አዘጋጅ',
                      style: TextStyle(color: Colors.grey[700], fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
        GestureDetector(
          //onTap: createTest(),
          child: Container(
            height: 200,
            width: 400,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.indigo[100],
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    right: 20,
                    child: Icon(Icons.book, size: 90, color: Colors.grey[300])),
                Positioned(
                    bottom: 50,
                    right: 120,
                    child: Text(
                      'ፈተና አዘጋጅ',
                      style: TextStyle(color: Colors.grey[700], fontSize: 20),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
