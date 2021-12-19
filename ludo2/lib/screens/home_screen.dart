import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ludo2/widgets/dice.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dice = Random();
  int turn = 0;
  int green = 0;
  int yellow = 0;
  int blue = 0;
  int red = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        elevation: 12,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // if (turn == 0)
                  turn == 0
                      ? Container(
                          alignment: Alignment.topLeft,
                          height: 100,
                          width: 100,
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                green = dice.nextInt(6) + 1;
                                if (green == 6) {
                                } else {
                                  turn = 1;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Transform.scale(
                                scale: .9,
                                child: Image(
                                  image: AssetImage('assets/$green.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          height: 100,
                          width: 100,
                          color: Colors.green,
                          child: Opacity(
                            opacity: .5,
                            child: Transform.scale(
                              scale: .9,
                              child: Image(
                                image: AssetImage('assets/$green.png'),
                              ),
                            ),
                          ),
                        ),

                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    color: Colors.white,
                  ),
                  // if (turn == 1)
                  turn == 1
                      ? Container(
                          alignment: Alignment.topRight,
                          height: 100,
                          width: 100,
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                yellow = dice.nextInt(6) + 1;
                                if (yellow == 6) {
                                } else {
                                  turn = 2;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Transform.scale(
                                scale: .9,
                                child: Image(
                                  image: AssetImage('assets/$yellow.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          height: 100,
                          width: 100,
                          color: Colors.yellow,
                          child: Opacity(
                            opacity: .5,
                            child: Transform.scale(
                              scale: .9,
                              child: Image(
                                image: AssetImage('assets/$yellow.png'),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/Ludo_board.png"),
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // if (turn == 3)

                  turn == 3
                      ? Container(
                          alignment: Alignment.topLeft,
                          height: 100,
                          width: 100,
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                red = dice.nextInt(6) + 1;
                                if (red == 6) {
                                } else {
                                  turn = 0;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Transform.scale(
                                scale: .9,
                                child: Image(
                                  image: AssetImage('assets/$red.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          height: 100,
                          width: 100,
                          color: Colors.red,
                          child: Opacity(
                            opacity: .5,
                            child: Transform.scale(
                              scale: .9,
                              child: Image(
                                image: AssetImage('assets/$red.png'),
                              ),
                            ),
                          ),
                        ),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    color: Colors.white,
                  ),
                  // if (turn == 2)
                  turn == 2
                      ? Container(
                          alignment: Alignment.topRight,
                          height: 100,
                          width: 100,
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                blue = dice.nextInt(6) + 1;
                                if (blue == 6) {
                                } else {
                                  turn = 3;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Transform.scale(
                                scale: .9,
                                child: Image(
                                  image: AssetImage('assets/$blue.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          height: 100,
                          width: 100,
                          color: Colors.blue,
                          child: Opacity(
                            opacity: .5,
                            child: Transform.scale(
                              scale: .9,
                              child: Image(
                                image: AssetImage('assets/$blue.png'),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
