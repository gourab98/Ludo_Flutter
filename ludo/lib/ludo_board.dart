import 'package:flutter/material.dart';
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
                                    //child: Text("$index"),
                                  ),
                                );
                              },
                            ),
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
                          ludoPiece(
                              left: boardSize * (1 / 15),
                              top: boardSize * (1 / 15),
                              pieceSize: pieceSize,
                              color: Colors.green.shade300),
                          ludoPiece(
                              left: boardSize * (4 / 15),
                              top: boardSize * (1 / 15),
                              pieceSize: pieceSize,
                              color: Colors.green.shade300),
                          ludoPiece(
                              left: boardSize * (1 / 15),
                              top: boardSize * (4 / 15),
                              pieceSize: pieceSize,
                              color: Colors.green.shade300),
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
