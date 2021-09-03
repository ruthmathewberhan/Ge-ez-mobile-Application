import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetailPageExam extends StatelessWidget{
  final int index;

  DetailPageExam(this.index);


  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(

              color: Color(0xFFCAB5BF),
            ),
          ),
          leading: IconButton(
            icon:Icon(Icons.arrow_back) ,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailPageExam (index),
                ),
              );

            },
          ),
          title: Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),

                    ),
                    hintText: "Content",
                    hintStyle: TextStyle(fontSize: 30),
                    fillColor:  Color(0xFFE0E0E0),
                    filled: true,


                  ),
                  maxLines: 20,
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  width: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Color(0xFFCAB5BF),


                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Edit',
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
              ],

            ),
          ),
        )

    );
  }

}