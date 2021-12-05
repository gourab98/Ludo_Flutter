import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

Widget CellColorOnBoard(
    {required List CellColorOnBoard,
    required Color color,
    required int index}) {
  return Center(
    child: CellColorOnBoard.contains(index)
        ? Container(
            child: Center(child: Text("$index")),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black),
            ),
          )
        : Container(),
  );
}
