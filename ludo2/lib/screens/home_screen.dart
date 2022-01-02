import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ludo2/Piece_animation.dart';
import 'package:ludo2/widgets/white_glow.dart';
import 'package:ludo2/widgets/anti_tile.dart';
import 'package:ludo2/widgets/selected_piece_glowing.dart';
import 'package:ludo2/widgets/sound.dart';
import 'package:ludo2/widgets/tile.dart';

// This is the ludo board class.
class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double pi = 3.1415926535897932;
  var dice = Random();
  var allSound = Sound();
  int threeSix = 0;
  int turn = 0;
  int green = 0;
  int yellow = 0;
  int blue = 0;
  int red = 0;

  bool g1FromBoard = false;
  bool g2FromBoard = false;
  bool g3FromBoard = false;
  bool g4FromBoard = false;
  int g1 = 2;
  int g1Clear = 1;

  List greenPiecePath = [
    91,
    92,
    93,
    94,
    95,
    81,
    66,
    51,
    36,
    21,
    6,
    7,
    8,
    23,
    38,
    53,
    68,
    83,
    99,
    100,
    101,
    102,
    103,
    104,
    119,
    134,
    133,
    132,
    131,
    130,
    129,
    143,
    158,
    173,
    188,
    203,
    218,
    217,
    216,
    201,
    186,
    171,
    156,
    141,
    125,
    124,
    123,
    122,
    121,
    120,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
  ];

  List greenValue = [];
  List yellowValue = [];
  List blueValue = [];
  List redValue = [];
//Testing
  int crossAxisCount = 15;
  int g1CurrentPosition = 32;
  int g1Value = 0;

  int g2CurrentPosition = 33;
  int g2Value = 0;

  int g3CurrentPosition = 47;
  int g3Value = 0;
  int g4CurrentPosition = 48;
  int g4Value = 0;

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
        centerTitle: true,
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
                                allSound.diceSound();
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
                                allSound.diceSound();
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

                    // Testing
                    double boxWidth = constraints.maxWidth / 15;

                    Offset getPosition(int index) {
                      assert(boxWidth != null,
                          "init boxWidth inside layoutBuilder");
                      final dx = index <= crossAxisCount
                          ? index * boxWidth
                          : (index % crossAxisCount) * boxWidth;
                      final dy = index <= crossAxisCount
                          ? 0.0
                          : (index / crossAxisCount).floor() * boxWidth;
                      return Offset(dx, dy);
                    }

                    return Stack(
                      clipBehavior: Clip.none,
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
                                return Stack(
                                  children: <Widget>[
                                    Container(
                                      //child: Center(child: Text("$index")),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(color: Colors.black),
                                      ),
                                    ),
                                    //// It is for g1 piece.s
                                    // Tile(
                                    //   pieceSize: pieceSize,
                                    //   color: Colors.greenAccent,
                                    //   index: index,
                                    //   accessedCell: greenPiecePath[g1],
                                    //   child: GestureDetector(
                                    //     onTap: () async {
                                    //       print("I am pressed");
                                    //       if (g1 + green <= 57) {
                                    //         for (int i = 0; i < green; i++) {
                                    //           await Future.delayed(
                                    //               Duration(milliseconds: 100));
                                    //           setState(() {
                                    //             g1Clear = g1;
                                    //             g1 = g1 + 1;
                                    //             allSound.pieceSound();
                                    //           });
                                    //         }
                                    //         //green = 0;
                                    //       }
                                    //     },
                                    //     child: Container(
                                    //       child: green != 0
                                    //           ? Glowing(
                                    //               pieceSize: pieceSize,
                                    //               color: Colors.greenAccent,
                                    //             )
                                    //           : null,
                                    //       //height: pieceSize,
                                    //       //width: pieceSize,
                                    //       decoration: BoxDecoration(
                                    //         borderRadius:
                                    //             BorderRadius.circular(500),
                                    //         border:
                                    //             Border.all(color: Colors.black),
                                    //         color: Colors.greenAccent,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    //// It is for abolishing the g1 point.
                                    // IgnorePointer(
                                    //   child: Center(
                                    //     child: AntiTile(
                                    //       index: index,
                                    //       accessedCell: greenPiecePath[g1Clear],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                        //g1 Piece
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          left: getPosition(g1CurrentPosition).dx,
                          top: getPosition(g1CurrentPosition).dy,
                          child: Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth / crossAxisCount,
                            height: constraints.maxWidth / crossAxisCount,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                if (g1Value + green <= 57) {
                                  for (int j = 0; j < green; j++) {
                                    await Future.delayed(
                                        const Duration(milliseconds: 350));
                                    setState(() {
                                      g1CurrentPosition =
                                          greenPiecePath[g1Value];
                                      g1Value++;
                                    });
                                    allSound.pieceSound();
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        //g2 Piece
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          left: getPosition(g2CurrentPosition).dx,
                          top: getPosition(g2CurrentPosition).dy,
                          child: Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth / crossAxisCount,
                            height: constraints.maxWidth / crossAxisCount,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                if (g2Value + green <= 57) {
                                  for (int j = 0; j < green; j++) {
                                    await Future.delayed(
                                        const Duration(milliseconds: 350));
                                    setState(() {
                                      g2CurrentPosition =
                                          greenPiecePath[g2Value];
                                      g2Value++;
                                    });
                                    allSound.pieceSound();
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        //g3 Piece
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          left: getPosition(g3CurrentPosition).dx,
                          top: getPosition(g3CurrentPosition).dy,
                          child: Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth / crossAxisCount,
                            height: constraints.maxWidth / crossAxisCount,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                if (g3Value + green <= 57) {
                                  for (int j = 0; j < green; j++) {
                                    await Future.delayed(
                                        const Duration(milliseconds: 350));
                                    setState(() {
                                      g3CurrentPosition =
                                          greenPiecePath[g3Value];
                                      g3Value++;
                                    });
                                    allSound.pieceSound();
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        //g4 Piece
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          left: getPosition(g4CurrentPosition).dx,
                          top: getPosition(g4CurrentPosition).dy,
                          child: Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth / crossAxisCount,
                            height: constraints.maxWidth / crossAxisCount,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                if (g4Value + green <= 57) {
                                  for (int j = 0; j < green; j++) {
                                    await Future.delayed(
                                        const Duration(milliseconds: 350));
                                    setState(() {
                                      g4CurrentPosition =
                                          greenPiecePath[g4Value];
                                      g4Value++;
                                    });
                                    allSound.pieceSound();
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        // // g1FromBoard:
                        // AnimatedPositioned(
                        //   duration: Duration(milliseconds: 250),
                        //   top: (g1FromBoard)
                        //       ? (6 * boardSize / 15) // - 7.5
                        //       : (2 * boardSize / 15),
                        //   left: (g1FromBoard)
                        //       ? (1 * boardSize / 15) - 7.5
                        //       : (2 * boardSize / 15),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       setState(() {
                        //         g1FromBoard = !g1FromBoard;
                        //         print('I am being pressed $g1FromBoard');
                        //       });
                        //     },
                        //     child: Container(
                        //       //margin: EdgeInsets.all(10),
                        //       height: pieceSize,
                        //       width: pieceSize,
                        //       decoration: BoxDecoration(
                        //         borderRadius: g1FromBoard
                        //             ? BorderRadius.circular(50)
                        //             : BorderRadius.circular(50),
                        //         border: Border.all(color: Colors.black),
                        //         color: g1FromBoard
                        //             ? Colors.green
                        //             : Colors.greenAccent,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // // g2FromBoard:
                        // AnimatedPositioned(
                        //   duration: Duration(milliseconds: 250),
                        //   top: (g2FromBoard)
                        //       ? (6 * boardSize / 15)
                        //       : (2 * boardSize / 15),
                        //   left: (g2FromBoard)
                        //       ? (1 * boardSize / 15) - 2.5
                        //       : (3 * boardSize / 15),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       setState(() {
                        //         g2FromBoard = !g2FromBoard;
                        //         print('I am being pressed $g2FromBoard');
                        //       });
                        //     },
                        //     child: Container(
                        //       height: pieceSize,
                        //       width: pieceSize,
                        //       decoration: BoxDecoration(
                        //         borderRadius: g2FromBoard
                        //             ? BorderRadius.circular(50)
                        //             : BorderRadius.circular(50),
                        //         border: Border.all(color: Colors.black),
                        //         color:
                        //             g2FromBoard ? Colors.green : Colors.yellow,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // // g3FromBoard:
                        // AnimatedPositioned(
                        //   duration: Duration(milliseconds: 250),
                        //   top: (g3FromBoard)
                        //       ? (6 * boardSize / 15)
                        //       : (3 * boardSize / 15),
                        //   left: (g3FromBoard)
                        //       ? (1 * boardSize / 15) + 2.5
                        //       : (3 * boardSize / 15),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       setState(() {
                        //         g3FromBoard = !g3FromBoard;
                        //         print('I am being pressed $g3FromBoard');
                        //       });
                        //     },
                        //     child: Container(
                        //       height: pieceSize,
                        //       width: pieceSize,
                        //       decoration: BoxDecoration(
                        //         borderRadius: g3FromBoard
                        //             ? BorderRadius.circular(50)
                        //             : BorderRadius.circular(50),
                        //         border: Border.all(color: Colors.black),
                        //         color: g3FromBoard ? Colors.green : Colors.blue,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // // g4FromBoard:
                        // AnimatedPositioned(
                        //   duration: Duration(milliseconds: 250),
                        //   top: (g4FromBoard)
                        //       ? (6 * boardSize / 15)
                        //       : (3 * boardSize / 15),
                        //   left: (g4FromBoard)
                        //       ? (1 * boardSize / 15) + 7.5
                        //       : (2 * boardSize / 15),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       setState(() {
                        //         g4FromBoard = !g4FromBoard;
                        //         print('I am being pressed $g4FromBoard');
                        //       });
                        //     },
                        //     child: Container(
                        //       height: pieceSize,
                        //       width: pieceSize,
                        //       decoration: BoxDecoration(
                        //         borderRadius: g4FromBoard
                        //             ? BorderRadius.circular(50)
                        //             : BorderRadius.circular(50),
                        //         border: Border.all(color: Colors.black),
                        //         color: g4FromBoard ? Colors.green : Colors.red,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //Rotation Example:
                        // Positioned(
                        //   top: 2 * boardSize / 15 - (pieceSize / 2),
                        //   left: 6 * boardSize / 15 - (pieceSize / 2),
                        //   child: Center(
                        //     child: Container(
                        //       child: TestRotation(
                        //         color: Colors.blue,
                        //         pieceSize: pieceSize,
                        //       ),
                        //       clipBehavior: Clip.none,
                        //       height: pieceSize * 2,
                        //       width: pieceSize * 2,
                        //       // decoration: BoxDecoration(
                        //       //   borderRadius: BorderRadius.circular(50),
                        //       //   border: Border.all(color: Colors.black),
                        //       //   color: Colors.transparent,
                        //       // ),
                        //     ),
                        //   ),
                        // ),
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
                                allSound.diceSound();
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
                                allSound.diceSound();
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
