import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double left;
  final double top;
  final double right;
  final double bottom;
  Color color;

  MyPainter({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(left, top, right, bottom);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
