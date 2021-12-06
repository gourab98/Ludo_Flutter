import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ludo/anti_tile.dart';
import 'package:ludo/cell_color_on_board.dart';
import 'package:ludo/glowing_side.dart';
import 'dart:math';

import 'package:ludo/ludo_piece.dart';
import 'package:ludo/ludo_quarter_painter.dart';
import 'package:ludo/tile.dart';

class LudoBoard extends StatefulWidget {
  final String colorName;
  final String playerName;

  const LudoBoard({
    required this.colorName,
    required this.playerName,
  });

  @override
  _LudoBoardState createState() => _LudoBoardState();
}

class _LudoBoardState extends State<LudoBoard> {
  var dice = Random();
  int number = 1;
  int flag = 0;
  int threeSix = 0;
  Map<String, bool> greenPiece = {
    'g1': false,
    'g2': false,
    'g3': false,
    'g4': false
  };
  Map<String, bool> yellowPiece = {
    'y1': false,
    'y2': false,
    'y3': false,
    'y4': false
  };
  Map<String, bool> bluePiece = {
    'b1': false,
    'b2': false,
    'b3': false,
    'b4': false
  };
  Map<String, bool> redPiece = {
    'r1': false,
    'r2': false,
    'r3': false,
    'r4': false
  };
  // Each Color decoration list:
  List greenCellColorOnBoard = [91, 106, 107, 108, 109, 110];
  List yellowCellColorOnBoard = [23, 22, 37, 52, 67, 82];
  List blueCellColorOnBoard = [133, 118, 117, 116, 115, 114];
  List redCellColorOnBoard = [201, 202, 187, 172, 157, 142];
  // Final Cell List:
  List finalCellColorOnBoard = [96, 97, 98, 111, 112, 113, 126, 127, 128];
  // All Four(4) Stars List:
  List allStar = [91, 23, 133, 201];

  //All Piecess
  int g1 = 0;
  int g1Clear = 0;
  int y1 = 0;
  int b1 = 0;
  int r1 = 0;
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
  List yellowPiecePath = [
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
    90,
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
    22,
    37,
    52,
    67,
    82,
    97
  ];
  List bluePiecePath = [
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
    90,
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
    118,
    117,
    116,
    115,
    114,
    113,
  ];
  List redPiecePath = [
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
    90,
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
    202,
    187,
    172,
    157,
    142,
    127,
  ];
  List allPathWithOutStar = [
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
    90,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.colorName}  ${widget.playerName}"),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            LayoutBuilder(
              builder: (context, constraints) {
                double sizeHeight = constraints.maxHeight;
                double sizeWeight = constraints.maxWidth;
                Size size = Size(sizeHeight, sizeWeight);
                double boardSize = size.height;
                double pieceSize = size.height / 15;

                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: <Widget>[
                          GridView.count(
                            crossAxisCount: 15,
                            childAspectRatio: 1,
                            children: List<Widget>.generate(
                              225,
                              (index) {
                                return Stack(
                                  children: [
                                    GridTile(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "$index",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    CellColorOnBoard(
                                        CellColorOnBoard: greenCellColorOnBoard,
                                        color: Colors.green.shade200,
                                        index: index),
                                    CellColorOnBoard(
                                        CellColorOnBoard:
                                            yellowCellColorOnBoard,
                                        color: Colors.yellow.shade200,
                                        index: index),
                                    CellColorOnBoard(
                                        CellColorOnBoard: blueCellColorOnBoard,
                                        color: Colors.blue.shade200,
                                        index: index),
                                    CellColorOnBoard(
                                        CellColorOnBoard: redCellColorOnBoard,
                                        color: Colors.red.shade200,
                                        index: index),
                                    CellColorOnBoard(
                                        CellColorOnBoard: finalCellColorOnBoard,
                                        color: Colors.indigo.shade200,
                                        index: index),
                                    Center(
                                      child: allStar.contains(index)
                                          ? Container(
                                              child: Center(
                                                child: Icon(
                                                  Icons.star,
                                                  size: pieceSize,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ),
                                    Center(
                                      child: Tile(
                                        index: index,
                                        color: Colors.green,
                                        accessedCell: greenPiecePath[g1],
                                      ),
                                    ),
                                    Center(
                                      child: AntiTile(
                                        index: index,
                                        accessedCell: greenPiecePath[g1Clear],
                                      ),
                                    ),
                                    Center(
                                      child: Tile(
                                        index: index,
                                        color: Colors.yellow,
                                        accessedCell: yellowPiecePath[y1],
                                      ),
                                    ),
                                    Center(
                                      child: Tile(
                                        index: index,
                                        color: Colors.blue,
                                        accessedCell: bluePiecePath[b1],
                                      ),
                                    ),
                                    Center(
                                      child: Tile(
                                        index: index,
                                        color: Colors.red,
                                        accessedCell: redPiecePath[r1],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          if (flag == 0)
                            Glowing(
                              color: Colors.green.shade600,
                              offset: Offset(-250, -250),
                              blurRadius: 150,
                              spreadRadius: -30,
                            ),
                          if (flag == 1)
                            Glowing(
                              color: Colors.yellow.shade600,
                              offset: Offset(250, -250),
                              blurRadius: 150,
                              spreadRadius: -30,
                            ),
                          if (flag == 2)
                            Glowing(
                              color: Colors.blue.shade600,
                              offset: Offset(150, 150),
                              spreadRadius: -130,
                              blurRadius: 150,
                            ),

                          if (flag == 3)
                            Glowing(
                              color: Colors.red.shade600,
                              offset: Offset(-150, 150),
                              blurRadius: 150,
                              spreadRadius: -130,
                            ),
                          // LeftUp Board Color(Green)
                          CustomPaint(
                            size: Size(sizeHeight, sizeWeight),
                            painter: MyPainter(
                                left: 0.0,
                                top: 0.0,
                                right: (size.height) * 6 / 15,
                                bottom: (size.height) * 6 / 15,
                                color: Colors.green.shade800),
                          ),

                          if (greenPiece['g1'] == true)
                            ludoPiece(
                                left: boardSize * (1 / 15),
                                top: boardSize * (1 / 15),
                                pieceSize: pieceSize,
                                color: Colors.green.shade300),
                          if (greenPiece['g2'] == true)
                            ludoPiece(
                                left: boardSize * (4 / 15),
                                top: boardSize * (1 / 15),
                                pieceSize: pieceSize,
                                color: Colors.green.shade300),
                          if (greenPiece['g3'] == true)
                            ludoPiece(
                                left: boardSize * (1 / 15),
                                top: boardSize * (4 / 15),
                                pieceSize: pieceSize,
                                color: Colors.green.shade300),
                          if (greenPiece['g4'] == true)
                            ludoPiece(
                                left: boardSize * (4 / 15),
                                top: boardSize * (4 / 15),
                                pieceSize: pieceSize,
                                color: Colors.green.shade300),
                          //RightUp Board Color(Yellow)
                          CustomPaint(
                            size: Size(sizeHeight, sizeWeight),
                            painter: MyPainter(
                                left: (size.height) * 9 / 15,
                                top: 0.0,
                                right: size.height,
                                bottom: (size.height) * 6 / 15,
                                color: Colors.yellow.shade800),
                          ),
                          if (yellowPiece['y1'] == true)
                            ludoPiece(
                                left: boardSize * (10 / 15),
                                top: boardSize * (1 / 15),
                                pieceSize: pieceSize,
                                color: Colors.yellow.shade300),
                          if (yellowPiece['y2'] == true)
                            ludoPiece(
                                left: boardSize * (13 / 15),
                                top: boardSize * (1 / 15),
                                pieceSize: pieceSize,
                                color: Colors.yellow.shade300),
                          if (yellowPiece['y3'] == true)
                            ludoPiece(
                                left: boardSize * (10 / 15),
                                top: boardSize * (4 / 15),
                                pieceSize: pieceSize,
                                color: Colors.yellow.shade300),
                          if (yellowPiece['y4'] == true)
                            ludoPiece(
                                left: boardSize * (13 / 15),
                                top: boardSize * (4 / 15),
                                pieceSize: pieceSize,
                                color: Colors.yellow.shade300),
                          //LeftDown Board Color(Red)
                          CustomPaint(
                            size: Size(sizeHeight, sizeWeight),
                            painter: MyPainter(
                                left: 0.0,
                                top: (size.height) * 9 / 15,
                                right: (size.height) * 6 / 15,
                                bottom: size.height,
                                color: Colors.red.shade800),
                          ),
                          if (bluePiece['b1'] == true)
                            ludoPiece(
                                left: boardSize * (1 / 15),
                                top: boardSize * (10 / 15),
                                pieceSize: pieceSize,
                                color: Colors.red.shade300),
                          if (bluePiece['b2'] == true)
                            ludoPiece(
                                left: boardSize * (4 / 15),
                                top: boardSize * (10 / 15),
                                pieceSize: pieceSize,
                                color: Colors.red.shade300),
                          if (bluePiece['b3'] == true)
                            ludoPiece(
                                left: boardSize * (1 / 15),
                                top: boardSize * (13 / 15),
                                pieceSize: pieceSize,
                                color: Colors.red.shade300),
                          if (bluePiece['b4'] == true)
                            ludoPiece(
                                left: boardSize * (4 / 15),
                                top: boardSize * (13 / 15),
                                pieceSize: pieceSize,
                                color: Colors.red.shade300),
                          // RightDown Board Color(Blue):
                          CustomPaint(
                            size: Size(sizeHeight, sizeWeight),
                            painter: MyPainter(
                              left: (size.height) * 9 / 15,
                              top: (size.height) * 9 / 15,
                              right: size.height,
                              bottom: size.height,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          if (redPiece['r1'] == true)
                            ludoPiece(
                                left: boardSize * (10 / 15),
                                top: boardSize * (10 / 15),
                                pieceSize: pieceSize,
                                color: Colors.blue.shade300),
                          if (redPiece['r2'] == true)
                            ludoPiece(
                                left: boardSize * (13 / 15),
                                top: boardSize * (10 / 15),
                                pieceSize: pieceSize,
                                color: Colors.blue.shade300),
                          if (redPiece['r3'] == true)
                            ludoPiece(
                                left: boardSize * (10 / 15),
                                top: boardSize * (13 / 15),
                                pieceSize: pieceSize,
                                color: Colors.blue.shade300),
                          if (redPiece['r4'] == true)
                            ludoPiece(
                                left: boardSize * (13 / 15),
                                top: boardSize * (13 / 15),
                                pieceSize: pieceSize,
                                color: Colors.blue.shade300),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  number = dice.nextInt(6);
                  //g1 experimental moves:
                  if (g1 + number + 1 <= 56 && greenPiece['g1'] == true) {
                    g1Clear = g1;
                    g1 = number + g1 + 1;
                  }
                  // number = 5;
//                  flag = flag % 4;
                  if (flag == 0) {
                    print("Flag is $flag = Green value =${number + 1}");
                  } else if (flag == 1) {
                    print("Flag is $flag = Yellow value =${number + 1}");
                  } else if (flag == 2) {
                    print("Flag is $flag = Blue value =${number + 1}");
                  } else if (flag == 3) {
                    print("Flag is $flag = Red value =${number + 1}");
                  }

                  if (number == 5 && threeSix != 2) {
                    threeSix++;
                    if (flag == 0) {
                      greenPiece['g1'] = true;
                    }
                    if (flag == 1) {
                      yellowPiece['y1'] = true;
                    }
                    if (flag == 2) {
                      bluePiece['b1'] = true;
                    }
                    if (flag == 3) {
                      redPiece['r1'] = true;
                    }
                  } else {
                    flag++;
                    if (flag >= 4) {
                      flag = 0;
                    }
                    threeSix = 0;
                  }
                  // print("$flag");
                  // First moves:
                  // if (g1 + number + 1 <= 56 &&
                  //     greenPiece['g1'] == true &&
                  //     flag == 0) {
                  //   g1 = number + g1 + 1;
                  // } else if (y1 + number + 1 <= 56 &&
                  //     yellowPiece['y1'] == true &&
                  //     flag == 1) {
                  //   y1 = number + y1 + 1;
                  // } else if (b1 + number + 1 <= 56 &&
                  //     bluePiece['b1'] == true &&
                  //     flag == 2) {
                  //   b1 = number + b1 + 1;
                  // } else if (r1 + number + 1 <= 56 &&
                  //     redPiece['r1'] == true &&
                  //     flag == 3) {
                  //   r1 = number + r1 + 1;
                  // }
                });
              },
              child: Container(
                alignment: Alignment.topCenter,
                child: Transform.scale(
                  scale: .4,
                  child: Image(
                    image: AssetImage('assets/$number.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
