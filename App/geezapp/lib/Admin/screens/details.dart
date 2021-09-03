import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:js';



class DetailPage extends StatelessWidget{
  final int index;

  DetailPage(this.index);


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
              Navigator.pop(context);
            },
          ),
          title: Text(''),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
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

                  Padding(
                    padding: const EdgeInsets.all(10.0),

                    child: Row(

                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 100.0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.green,


                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Approve',
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

                        RaisedButton(
                          onPressed: () {},
                          color: Colors.red,


                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Deny',
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
        ),
      );

  }
    void moveToLastScreen(){
      //Navigator.pop(context);
    }


}