import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({
    required this.color,
    required this.index,
    required this.accessedCell,
    Key? key,
  }) : super(key: key);

  final int index;
  final int accessedCell;
  final Color color;

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: _isAccessed ? widget.color : Colors.transparent,
        //   border:
        //       Border.all(color: _isAccessed ? Colors.blue : Colors.transparent),
      ),
      // child:
      //     FittedBox(fit: BoxFit.contain, child: Text(widget.index.toString())),
    );
  }
}
