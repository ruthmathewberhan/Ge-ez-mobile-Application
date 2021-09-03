import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    // appBar: AppBar(
    //     leading: Icon(Icons.home),
    //     title: Text('Home'),
    //     actions: [Icon(Icons.more_vert)]),
    body: HomeLessons(),
  )));
}

class HomeLessons extends StatelessWidget {
  const HomeLessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Row(
            children: [
              Container(
                //width: 70.0,
                padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
                margin: const EdgeInsets.fromLTRB(10, 20, 40, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green[50],
                ),
                child: Text('Lessons',
                    style: TextStyle(color: Colors.red[300], fontSize: 17)),
              ),
              // Expanded(
              //   child: Container(
              //       ////padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
              //       margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20.0),
              //         //color: Colors.green[50],
              //       ),
              //       child: TextFormField(
              //         decoration: InputDecoration(
              //           hintText: "Search",
              //           //border: BorderStyle.solid,
              //         ),
              //       )),
              // ),
              // Container(
              //   margin: const EdgeInsetsDirectional.only(top: 10.0),
              //   child: const IconButton(
              //     onPressed: null,
              //     icon: Icon(Icons.search),
              //     tooltip: 'Search',
              //   ),
              // ),
            ],
          ),
          Container(
            height: 200.0,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     color: Colors.red[300]),
            //child: Text('hello'),
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepOrange[100]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Stack(children: [
                          Text('Course Title',
                              style: TextStyle(color: Colors.grey[700])),
                        ]),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text('lesson 2',
                            style: TextStyle(color: Colors.grey[500])),
                      )
                    ],
                  ),
                ),

                ///////////

                Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepOrange[100]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Stack(children: [
                          Text('Course Title',
                              style: TextStyle(color: Colors.grey[700])),
                        ]),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text('lesson 2',
                            style: TextStyle(color: Colors.grey[500])),
                      )
                    ],
                  ),
                ),

                Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepOrange[100]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Stack(children: [
                          Text('Course Title',
                              style: TextStyle(color: Colors.grey[700])),
                        ]),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text('lesson 2',
                            style: TextStyle(color: Colors.grey[500])),
                      )
                    ],
                  ),
                ),

                Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepOrange[100]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Stack(children: [
                          Text('Course Title',
                              style: TextStyle(color: Colors.grey[700])),
                        ]),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text('lesson 2',
                            style: TextStyle(color: Colors.grey[500])),
                      )
                    ],
                  ),
                ),

                ///////////

                // s
              ],
            ),
          ),

          ///////////////

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //width: 70.0,
                padding: const EdgeInsets.fromLTRB(15.0, 3.0, 40.0, 3.0),
                margin: const EdgeInsets.fromLTRB(10, 20, 40, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green[50],
                ),
                child: Text('Tests',
                    style: TextStyle(color: Colors.red[300], fontSize: 17)),
              ),
              // Expanded(
              //   child: Container(
              //       ////padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
              //       margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20.0),
              //         //color: Colors.green[50],
              //       ),
              //       child: TextFormField(
              //         decoration: InputDecoration(
              //           hintText: "Search",
              //           //border: BorderStyle.solid,
              //         ),
              //       )),
              // ),
              // Container(
              //   margin: const EdgeInsetsDirectional.only(top: 10.0),
              //   child: const IconButton(
              //     onPressed: null,
              //     icon: Icon(Icons.search),
              //     tooltip: 'Search',
              //   ),
              // ),
            ],
          ),
          Container(
            height: 200.0,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     color: Colors.red[300]),
            //child: Text('hello'),
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink[800]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Stack(children: [
                          Text('Question',
                              style: TextStyle(color: Colors.grey[100])),
                        ]),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text('level 2',
                            style: TextStyle(color: Colors.grey[50])),
                      )
                    ],
                  ),
                ),

                ///////////

                Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink[800]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Stack(children: [
                          Text('Question',
                              style: TextStyle(color: Colors.grey[100])),
                        ]),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text('level 2',
                            style: TextStyle(color: Colors.grey[50])),
                      )
                    ],
                  ),
                ),

                Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink[800]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Stack(children: [
                          Text('Question',
                              style: TextStyle(color: Colors.grey[100])),
                        ]),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text('level 2',
                            style: TextStyle(color: Colors.grey[50])),
                      )
                    ],
                  ),
                ),
                ///////////
                ///
                Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink[800]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Stack(children: [
                          Text('Question',
                              style: TextStyle(color: Colors.grey[100])),
                        ]),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Text('level 2',
                            style: TextStyle(color: Colors.grey[50])),
                      )
                    ],
                  ),
                ),

                ///////////
              ],
            ),
          ),
        ],
      ),
    );
  }
}
