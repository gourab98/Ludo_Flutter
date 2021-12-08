import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

Widget BoardQuarterColor(
    {required List CellColorOnBoard,
    required Color color,
    required int index}) {
  return Center(
    child: CellColorOnBoard.contains(index)
        ? Container(
            child: Center(child: Text("$index")),
            decoration: BoxDecoration(
              //              border: Border.all(style: BorderStyle.none, color: Colors.white),
              color: color,
              borderRadius: BorderRadius.zero,
              //              border: Border.all(color: Colors.black),
            ),
          )
        : Container(),
  );
}
