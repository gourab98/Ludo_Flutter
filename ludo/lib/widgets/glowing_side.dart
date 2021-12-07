import 'package:flutter/material.dart';

Widget Glowing(
    {required Color color,
    required Offset offset,
    required double spreadRadius,
    required double blurRadius}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      boxShadow: [
        BoxShadow(
          spreadRadius: spreadRadius,
          offset: offset,
          color: color,
          blurRadius: blurRadius,
        ),
      ],
    ),
  );
}
