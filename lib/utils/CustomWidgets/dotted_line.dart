import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final dotSpacing = 6.0;
    final dotSize = 4.0;
    final startX = 0.0;
    final endX = size.width;
    final y = size.height / 2;

    var x = startX;
    while (x < endX) {
      canvas.drawLine(Offset(x, y), Offset(x + dotSize, y), paint);
      x += dotSize + dotSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}