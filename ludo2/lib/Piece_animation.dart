import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ludo2/widgets/selected_piece_glowing.dart';
import 'package:ludo2/widgets/sound.dart';

class Piece_animation extends StatelessWidget {
  const Piece_animation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: AnimatingPiece(),
      ),
    );
  }
}

class AnimatingPiece extends StatefulWidget {
  AnimatingPiece({Key? key}) : super(key: key);

  @override
  State<AnimatingPiece> createState() => _AnimatingPieceState();
}

class _AnimatingPieceState extends State<AnimatingPiece> {
  var dice = Random();

  var allSound = Sound();

  int green = 0;

  int g1 = 2;

  int g1Clear = 1;

  List greenPiecePath = [
    32,
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: GridView.count(
            crossAxisCount: 15,
            childAspectRatio: 1,
            children: List<Widget>.generate(
              225,
              (index) {
                return Stack(
                  fit: StackFit.passthrough,
                  children: [
                    GridTile(
                      child: Container(
                        child: Center(
                          child: Text("$index"),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                    Tile(
                      pieceSize: 10.0,
                      color: Colors.greenAccent,
                      index: index,
                      accessedCell: greenPiecePath[g1],
                      child: GestureDetector(
                        onTap: () async {
                          green = dice.nextInt(6) + 1;
                          print("I am pressed");
                          if (g1 + green <= 57) {
                            for (int i = 0; i < green; i++) {
                              await Future.delayed(Duration(milliseconds: 100));
                              setState(() {
                                print('The number: $green');
                                g1Clear = g1;
                                g1 = g1 + 1;
                                allSound.pieceSound();
                              });
                            }
                          }
                        },
                      ),
                    ),
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
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  Tile({
    required this.pieceSize,
    required this.color,
    required this.index,
    required this.accessedCell,
    required this.child,
    Key? key,
  }) : super(key: key);

  final int index;
  final double pieceSize;
  final int accessedCell;
  final Color color;
  Widget child;
  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool _isAccessed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.accessedCell == widget.index) {
      _isAccessed = true;
    }

    return Container(
      child: _isAccessed ? widget.child : null,
      height: widget.pieceSize,
      width: widget.pieceSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        border: _isAccessed ? Border.all(color: Colors.black) : null,
        color: _isAccessed ? widget.color : null,
      ),
    );
  }
}

class AntiTile extends StatefulWidget {
  AntiTile({
    required this.index,
    required this.accessedCell,
    Key? key,
  }) : super(key: key);

  final int index;
  final int accessedCell;

  @override
  State<AntiTile> createState() => _AntiTileState();
}

class _AntiTileState extends State<AntiTile> {
  bool _isAccessed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.accessedCell == widget.index) {
      _isAccessed = true;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: Colors.black),
        color: _isAccessed ? Colors.white : Colors.transparent,
      ),
    );
  }
}
