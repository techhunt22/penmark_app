import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../models/drawing/drawing_model.dart';

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> points;
  final DrawingMode drawingMode;

  DrawingPainter({
    required this.points,
    required this.drawingMode,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(Rect.largest, Paint());

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        // Only draw line between non-null points
        canvas.drawLine(
          points[i]!.offset,
          points[i + 1]!.offset,
          points[i]!.paint,
        );
      }
    }

    // Draw the last point if it exists
    if (points.isNotEmpty && points.last != null) {
      canvas.drawPoints(
        ui.PointMode.points,
        [points.last!.offset],
        points.last!.paint,
      );
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
