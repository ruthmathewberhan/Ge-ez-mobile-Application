import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    // appBar: AppBar(
    //     leading: Icon(Icons.home),
    //     title: Text('Home'),
    //     actions: [Icon(Icons.more_vert)]),
    body: Create(),
  )));
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
              color: Colors.pink[800],
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    right: 20,
                    child: Icon(Icons.topic, size: 90, color: Colors.white)),
                Positioned(
                    bottom: 50,
                    right: 100,
                    child: Text(
                      'ንዑስ ትምህርት አውጣ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
              color: Colors.pink[800],
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    right: 20,
                    child: Icon(Icons.book, size: 90, color: Colors.white)),
                Positioned(
                    bottom: 50,
                    right: 120,
                    child: Text(
                      'ፈተና አውጣ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
