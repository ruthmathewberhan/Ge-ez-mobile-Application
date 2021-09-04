import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ፈተና አዘጋጅ';
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
        body: CreateTest(),
      ),
    );
  }
}

class CreateTest extends StatefulWidget {
  CreateTest({Key? key}) : super(key: key);

  @override
  _CreateTestState createState() => _CreateTestState();
}

class _CreateTestState extends State<CreateTest> {
  String levelIntial = 'ደረጃ ፩';
  //bool _value = false;
  int initialvalue = -1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
              'የሚወስደው ሰዐት',
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
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'የሚወስደው ሰዐት'),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(4.0),
            margin: const EdgeInsets.all(5.0),
            child: Text(
              'ጥያቄ',
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
                InputDecoration(border: InputBorder.none, hintText: 'ጥያቄ'),
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ምርጫ ፩',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo[50],
                    ),
                    //height: 20,
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'ምርጫ ፩ መልስ'),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ምርጫ ፪',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo[50],
                    ),
                    //height: 20,
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'ምርጫ ፪ መልስ'),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ምርጫ ፫',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo[50],
                    ),
                    //height: 20,
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'ምርጫ ፫ መልስ'),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ምርጫ ፬',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo[50],
                    ),
                    //height: 20,
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'ምርጫ ፬ መልስ'),
                    ),
                  ),
                ),
              ],
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
            // ListTile(
            //   title: Text("Male"),
            //   leading: Radio(
            //     value: 1,
            //     groupValue: initialvalue,
            //     onChanged: (value) {
            //       setState(() {
            //         //initialvalue = value;
            //       });
            //     },
            //     activeColor: Colors.green,
            //   ),
            // ),
            // ListTile(
            //   title: Text("Female"),
            //   leading: Radio(
            //     value: 2,
            //     groupValue: initialvalue,
            //     onChanged: (value) {
            //       setState(() {
            //         //initialvalue = value;
            //       });
            //     },
            //     activeColor: Colors.green,
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}
