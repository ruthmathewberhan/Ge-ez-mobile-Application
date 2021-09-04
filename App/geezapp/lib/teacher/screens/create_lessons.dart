import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ንዑስ ርዕስ አዘጋጅ';
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
        body: CreateLesson(),
      ),
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
  String levelIntial = 'ደረጃ ፩';
  String courseIntial = 'ኮርስ ፩';

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          child: TextField(
            maxLines: 3,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: 'ንዑስ ርዕስ'),
          ),
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
              });
            },
            items: <String>['ደረጃ ፩', 'ደረጃ ፪', 'ደረጃ ፫']
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
              });
            },
            items: <String>['ኮርስ ፩', 'ኮርስ ፪', 'ኮርስ ፫']
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
          child: TextField(
            maxLines: 15,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'የትምህርቱ ሃተታ'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(25),
          height: 30,
          child: ElevatedButton(
            child: Text(
              'አስገባ',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
