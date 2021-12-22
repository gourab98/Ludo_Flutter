import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ludo2/widgets/sound.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dice = Random();
  var diceSound = Sound();
  int threeSix = 0;
  int turn = 0;
  int green = 0;
  int yellow = 0;
  int blue = 0;
  int red = 0;
  List firstPosition = [33];
  List lastPostion = [91];
  bool g2 = false;

  List greenValue = [];
  List yellowValue = [];
  List blueValue = [];
  List redValue = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                                greenValue.add(green);
                                diceSound.dicesound();
                                print('Green Color -> $green');
                                print('Green Value List-> $greenValue');
                                if (green == 6 && threeSix != 2) {
                                  threeSix++;
                                } else {
                                  turn = 1;
                                  threeSix = 0;
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
                                yellowValue.add(yellow);
                                print('Yellow Color -> $yellow');
                                diceSound.dicesound();
                                if (yellow == 6 && threeSix != 2) {
                                  threeSix++;
                                } else {
                                  turn = 2;
                                  threeSix = 0;
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
              // Container(
              //   alignment: Alignment.center,
              //   child: Image(
              //     image: AssetImage("assets/Ludo_board.png"),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double sizeHeight = constraints.maxHeight;
                    double sizeWeight = constraints.maxWidth;
                    Size size = Size(sizeHeight, sizeWeight);
                    double boardSize = size.height;
                    double pieceSize = size.height / 15;
                    //bool g2 = true;

                    return Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Ludo_board.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GridView.count(
                              crossAxisCount: 15,
                              childAspectRatio: 1,
                              children: List.generate(225, (index) {
                                return Container(
                                  //child: Center(child: Text("$index")),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(color: Colors.black),
                                    // color: Colors.amber,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 250),
                          top: (g2)
                              ? (6 * boardSize / 15)
                              : (2 * boardSize / 15),
                          left: (g2)
                              ? (1 * boardSize / 15)
                              : (3 * boardSize / 15),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                g2 = !g2;
                                print('I am being pressed $g2');
                              });
                            },
                            child: Container(
                              height: pieceSize,
                              width: pieceSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.black),
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
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
                                redValue.add(red);
                                print('Red Color -> $red');
                                diceSound.dicesound();
                                if (red == 6 && threeSix != 2) {
                                  threeSix++;
                                } else {
                                  turn = 0;
                                  threeSix = 0;
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
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 100,
                  //   width: 100,
                  //   color: Colors.white,
                  // ),
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
                                blueValue.add(blue);
                                print('Blue Color -> $blue');
                                diceSound.dicesound();
                                if (blue == 6 && threeSix != 2) {
                                  threeSix++;
                                } else {
                                  turn = 3;
                                  threeSix = 0;
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
