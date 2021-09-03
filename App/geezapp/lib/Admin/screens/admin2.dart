import 'package:geez_mekdi/main.dart';
import 'package:flutter/material.dart';
import 'package:geez_mekdi/screens/details.dart';
import 'package:geez_mekdi/screens/details_page_lesson.dart';
import 'package:geez_mekdi/screens/details_page_exam.dart';

class SimpleAppBarPage extends StatefulWidget {
  @override
  _SimpleAppBarPageState createState() => _SimpleAppBarPageState();
}

class _SimpleAppBarPageState extends State<SimpleAppBarPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(

        title: Text(MyApp.title),
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
            Tab( text: 'ዝርዝር'),
            Tab( text:'ትምህርቶች'),
            Tab( text: 'ፈተና'),

          ],
        ),
        elevation: 20,
        titleSpacing: 20,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),

      ),
      body: TabBarView(
        children: [
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
                subtitle: Text('ተጠቃሚ'),
                trailing: IconButton(
                  icon:Icon(Icons.arrow_forward) ,
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailPage (index),
                        ),
                    );

                  },
                )



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
                      title: Text('የትምህርቱ ርእስ'),

                      trailing: Icon(Icons.person_outline),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetailPagelesson (index)));
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
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetailPageExam (index)));
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

  Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 28),
    ),
  );
}