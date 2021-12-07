import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({
    required this.child,
    required this.diceValue,
    required this.pieceSize,
    required this.pieceName,
    required this.color,
    required this.index,
    required this.accessedCell,
    Key? key,
  }) : super(key: key);

  Widget child;
  final String pieceName;
  final int index;
  final double pieceSize;
  final int accessedCell;
  final Color color;
  final int diceValue;

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
      // child: _isAccessed
      //     ? Center(
      //         child: Text(widget.pieceName,
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 18,
      //               color: Colors.white,
      //             )),
      //       )
      //     : Center(
      //         child: Text(
      //           "",
      //           style: TextStyle(fontWeight: FontWeight.bold),
      //         ),
      //       ),
      // child: _isAccessed
      //     ? RawMaterialButton(
      //         onPressed: () {
      //           setState(() {
      //             print("I am green and I am working.");
      //           });
      //         },
      //       )
      //     : null,
      child: widget.child,
      height: widget.pieceSize,
      width: widget.pieceSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _isAccessed ? widget.color : Colors.transparent,
        //   border:
        //       Border.all(color: _isAccessed ? Colors.blue : Colors.transparent),
      ),
    );
  }
}
