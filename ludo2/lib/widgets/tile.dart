import 'package:flutter/material.dart';

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
