import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({
    required this.diceValue,
    required this.pieceSize,
    required this.pieceName,
    required this.color,
    required this.index,
    required this.accessedCell,
    required this.child,
    Key? key,
  }) : super(key: key);

  final String pieceName;
  final int index;
  final double pieceSize;
  final int accessedCell;
  final Color color;
  final int diceValue;
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
        color: _isAccessed ? widget.color : null,
        //   border:
        //       Border.all(color: _isAccessed ? Colors.blue : Colors.transparent),
      ),
    );
  }
}
