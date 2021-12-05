import 'package:flutter/material.dart';
import 'package:ludo/glowing_side.dart';
import 'dart:math';

import 'package:ludo/ludo_piece.dart';
import 'package:ludo/ludo_quarter_painter.dart';

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
                                return GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Text("$index"),
                                  ),
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
                                spreadRadius: -30),
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
                              spreadRadius: -130,
                              blurRadius: 150,
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
                          ludoPiece(
                              left: boardSize * (10 / 15),
                              top: boardSize * (1 / 15),
                              pieceSize: pieceSize,
                              color: Colors.yellow.shade300),
                          ludoPiece(
                              left: boardSize * (13 / 15),
                              top: boardSize * (1 / 15),
                              pieceSize: pieceSize,
                              color: Colors.yellow.shade300),
                          ludoPiece(
                              left: boardSize * (10 / 15),
                              top: boardSize * (4 / 15),
                              pieceSize: pieceSize,
                              color: Colors.yellow.shade300),
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
                          ludoPiece(
                              left: boardSize * (1 / 15),
                              top: boardSize * (10 / 15),
                              pieceSize: pieceSize,
                              color: Colors.red.shade300),
                          ludoPiece(
                              left: boardSize * (4 / 15),
                              top: boardSize * (10 / 15),
                              pieceSize: pieceSize,
                              color: Colors.red.shade300),
                          ludoPiece(
                              left: boardSize * (1 / 15),
                              top: boardSize * (13 / 15),
                              pieceSize: pieceSize,
                              color: Colors.red.shade300),
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
                          ludoPiece(
                              left: boardSize * (10 / 15),
                              top: boardSize * (10 / 15),
                              pieceSize: pieceSize,
                              color: Colors.blue.shade300),
                          ludoPiece(
                              left: boardSize * (13 / 15),
                              top: boardSize * (10 / 15),
                              pieceSize: pieceSize,
                              color: Colors.blue.shade300),
                          ludoPiece(
                              left: boardSize * (10 / 15),
                              top: boardSize * (13 / 15),
                              pieceSize: pieceSize,
                              color: Colors.blue.shade300),
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
                  // number = 5;
                  if (number == 5 && threeSix != 2) {
                    threeSix++;
                    if (flag == 0) {}
                  } else {
                    flag++;
                    threeSix = 0;
                  }

                  flag = flag % 4;
                  // if (flag == 0) {
                  //   print("Flag is $flag = Green");
                  // } else if (flag == 1) {
                  //   print("Flag is $flag = Yellow");
                  // } else if (flag == 2) {
                  //   print("Flag is $flag = Blue");
                  // } else if (flag == 3) {
                  //   print("Flag is $flag = Red");
                  // }
                  // print("Flag is = $flag");
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
