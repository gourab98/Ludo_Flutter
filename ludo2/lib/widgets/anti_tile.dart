import 'package:flutter/material.dart';

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
