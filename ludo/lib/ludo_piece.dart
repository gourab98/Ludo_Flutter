import 'package:flutter/material.dart';

Widget ludoPiece(
    {required double left,
    required double top,
    required double pieceSize,
    required Color color}) {
  return Positioned(
    left: left,
    top: top,
    child: Container(
      height: pieceSize,
      width: pieceSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(200.0)),
      ),
    ),
  );
}
