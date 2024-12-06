import 'package:flutter/material.dart';

class DrawingPoint {
  final Offset offset;
  final Paint paint;

  DrawingPoint({
    required this.offset,
    required this.paint,
  });
}

enum DrawingMode {
  pencil,
  marker,
  pen,
  eraser,
  fill, // Add this

}
