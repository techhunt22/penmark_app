import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:path_provider/path_provider.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  State<DrawingPage> createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  // Drawing points and history management
  List<DrawingPoint?> points = [];
  List<List<DrawingPoint?>> redoHistory = [];
  List<ShapeData> redoShapesHistory = [];
  bool isFilled = false;
  Color fillColor = Colors.transparent;
  // Drawing properties
  Color selectedColor = Colors.black;
  double strokeWidth = 3.0;
  DrawingMode drawingMode = DrawingMode.pencil;
  ShapeData? currentShape;
  List<ShapeData> shapes = [];
  int polygonSides = 5; // Default number of sides for polygon
  bool get isShapeMode {
    return [
      DrawingMode.rectangle,
      DrawingMode.circle,
      DrawingMode.triangle,
      DrawingMode.line,
      DrawingMode.polygon,
    ].contains(drawingMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: (points.isNotEmpty || shapes.isNotEmpty) ? undo : null,
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            onPressed: (redoHistory.isNotEmpty || redoShapesHistory.isNotEmpty)
                ? redo
                : null,
          ),

          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveDrawing,
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: clearCanvas,
          ),
        ],
      ),

      
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onTapDown: (details) {
                if (drawingMode == DrawingMode.fill) {
                  _floodFill(details.localPosition);
                }
              },
              onPanStart: (details) {
                setState(() {
                  redoHistory.clear(); // Clear redo history when new drawing starts
                  redoShapesHistory.clear();
                  if (drawingMode == DrawingMode.fill) {
                    _floodFill(details.localPosition);
                    return;
                  }
                  if (isShapeMode) {
                    currentShape = ShapeData(
                      start: details.localPosition,
                      paint: Paint()
                        ..color = selectedColor
                        ..strokeWidth = strokeWidth
                        ..style = PaintingStyle.stroke,
                      mode: drawingMode,
                      isFilled: isFilled,
                      fillColor: fillColor,
                      sides: drawingMode == DrawingMode.polygon ? polygonSides : 5, // Add this

                    );
                  } else {
                    points.add(
                      DrawingPoint(
                        offset: details.localPosition,
                        paint: Paint()
                          ..color = drawingMode == DrawingMode.eraser
                              ? Colors.white
                              : selectedColor
                          ..isAntiAlias = true
                          ..strokeWidth = strokeWidth
                          ..strokeCap = StrokeCap.round,
                      ),
                    );
                  }
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  if (isShapeMode) {
                    currentShape?.end = details.localPosition;
                  } else {
                    points.add(
                      DrawingPoint(
                        offset: details.localPosition,
                        paint: Paint()
                          ..color = drawingMode == DrawingMode.eraser
                              ? Colors.white
                              : selectedColor
                          ..isAntiAlias = true
                          ..strokeWidth = strokeWidth
                          ..strokeCap = StrokeCap.round,
                      ),
                    );
                  }
                });
              },
              onPanEnd: (details) {
                setState(() {
                  if (isShapeMode) {
                    if (currentShape != null) {
                      shapes.add(currentShape!);
                      currentShape = null;
                    }
                  } else {
                    points.add(null);
                  }
                });
              },
              child: CustomPaint(
                painter: DrawingPainter(
                  points: points,
                  shapes: shapes,
                  currentShape: currentShape,
                  drawingMode: drawingMode,
                  polygonSides: polygonSides, // Add this parameter

                ),
                size: Size.infinite,
              ),
            ),
          ),
          // Tools Panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.grey.shade200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drawing Tools
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildToolButton(
                          icon: Icons.brush,
                          mode: DrawingMode.pencil,
                          tooltip: 'Pencil',
                        ),
                        _buildToolButton(
                          icon: Icons.brush_outlined,
                          mode: DrawingMode.marker,
                          tooltip: 'Marker',
                        ),
                        _buildToolButton(
                          icon: Icons.edit,
                          mode: DrawingMode.pen,
                          tooltip: 'Pen',
                        ),
                        _buildToolButton(
                          icon: Icons.cleaning_services,
                          mode: DrawingMode.eraser,
                          tooltip: 'Eraser',
                        ),
                        _buildToolButton(
                          icon: Icons.rectangle_outlined,
                          mode: DrawingMode.rectangle,
                          tooltip: 'Rectangle',
                        ),
                        _buildToolButton(
                          icon: Icons.circle_outlined,
                          mode: DrawingMode.circle,
                          tooltip: 'Circle',
                        ),
                        _buildToolButton(
                          icon: Icons.change_history,
                          mode: DrawingMode.triangle,
                          tooltip: 'Triangle',
                        ),
                        _buildToolButton(
                          icon: Icons.linear_scale,
                          mode: DrawingMode.line,
                          tooltip: 'Line',
                        ),
                        _buildToolButton(
                          icon: Icons.hexagon,
                          mode: DrawingMode.polygon,
                          tooltip: 'Polygon',
                        ),
                        _buildToolButton(
                          icon: Icons.format_color_fill,
                          mode: DrawingMode.fill,
                          tooltip: 'Fill',
                        ),
                        if (drawingMode == DrawingMode.polygon)
                          SizedBox(
                            width: 60,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Sides',
                                contentPadding: EdgeInsets.all(8),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  polygonSides = int.tryParse(value) ?? 5;
                                });
                              },
                            ),
                          ),
                        const SizedBox(width: 10),

                        // Add the new code here ↓
                        if (isShapeMode) ...[
                          const SizedBox(width: 16),
                          // Fill toggle
                          ToggleButtons(
                            isSelected: [!isFilled, isFilled],
                            onPressed: (index) {
                              setState(() {
                                isFilled = index == 1;
                              });
                            },
                            children: const [
                              Tooltip(
                                message: 'Outline',
                                child: Icon(Icons.circle_outlined),
                              ),
                              Tooltip(
                                message: 'Filled',
                                child: Icon(Icons.circle),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          // Fill color picker (only visible when fill is enabled)
                          if (isFilled)
                            Tooltip(
                              message: 'Fill Color',
                              child: GestureDetector(
                                onTap: () => _showFillColorPicker(context),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: fillColor == Colors.transparent ? Colors.white : fillColor,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: fillColor == Colors.transparent
                                      ? const Icon(Icons.block, size: 20, color: Colors.red)
                                      : null,
                                ),
                              ),
                            ),
                        ],


                        // Color Picker Button
                        Tooltip(
                          message: 'Pick Color',
                          child: GestureDetector(
                            onTap: () => _showColorPicker(context),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: selectedColor,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Stroke Width Slider
                  Row(
                    children: [
                      const Icon(Icons.line_weight, size: 20),
                      Expanded(
                        child: Slider(
                          value: strokeWidth,
                          min: 1,
                          max: 20,
                          onChanged: (value) {
                            setState(() {
                              strokeWidth = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget _buildToolButton({
    required IconData icon,
    required DrawingMode mode,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(
          icon,
          color: drawingMode == mode ? Colors.blue : Colors.black,
        ),
        onPressed: () => setState(() => drawingMode = mode),
      ),
    );
  }

  void _showFillColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick fill color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: fillColor == Colors.transparent ? selectedColor : fillColor,
            onColorChanged: (color) {
              setState(() => fillColor = color);
            },
            pickerAreaHeightPercent: 0.8,
            enableAlpha: true,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => fillColor = Colors.transparent);
              Navigator.of(context).pop();
            },
            child: const Text('Clear Fill'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) {
              setState(() => selectedColor = color);
            },
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _floodFill(Offset position) {
    // Create a new shape for the filled area
    final shape = ShapeData(
      start: position,
      paint: Paint()
        ..color = selectedColor
        ..style = PaintingStyle.fill,
      mode: DrawingMode.fill,
      isFilled: true,
      fillColor: selectedColor,
    );

    setState(() {
      shapes.add(shape);
      // Add to undo history
      redoHistory.clear();
      redoShapesHistory.clear();
    });
  }



  void undo() {
    setState(() {
      if (isShapeMode) {
        if (shapes.isNotEmpty) {
          redoShapesHistory.add(shapes.removeLast());
        }
      } else {
        if (points.isNotEmpty) {
          List<DrawingPoint?> stroke = [];
          // Remove points until we hit a null (end of previous stroke)
          while (points.isNotEmpty && points.last != null) {
            stroke.add(points.removeLast());
          }
          // Remove the null marker
          if (points.isNotEmpty) {
            stroke.add(points.removeLast());
          }
          if (stroke.isNotEmpty) {
            redoHistory.add(stroke.reversed.toList());
          }
        }
      }
    });
  }

  // Update the redo method
  void redo() {
    setState(() {
      if (isShapeMode) {
        if (redoShapesHistory.isNotEmpty) {
          shapes.add(redoShapesHistory.removeLast());
        }
      } else {
        if (redoHistory.isNotEmpty) {
          points.addAll(redoHistory.removeLast());
        }
      }
    });
  }

  // Update the clear canvas method
  void clearCanvas() {
    setState(() {
      points.clear();
      shapes.clear();
      redoHistory.clear();
      redoShapesHistory.clear();
      currentShape = null;
    });
  }

  Future<void> saveDrawing() async {
    try {
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);

      // Draw white background
      final paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;
      canvas.drawRect(
        Rect.fromLTWH(0, 0, MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        paint,
      );


      // Draw the painting
      DrawingPainter(
        points: points,
        shapes: shapes,
        currentShape: currentShape,
        drawingMode: drawingMode,
      ).paint(canvas, MediaQuery.of(context).size);
      final picture = recorder.endRecording();
      final img = await picture.toImage(
        MediaQuery.of(context).size.width.toInt(),
        MediaQuery.of(context).size.height.toInt(),
      );
      final pngBytes = await img.toByteData(format: ui.ImageByteFormat.png);

      if (pngBytes != null) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File(
            '${directory.path}/drawing_${DateTime.now().millisecondsSinceEpoch}.png');
        await file.writeAsBytes(pngBytes.buffer.asUint8List());

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Drawing saved to ${file.path}')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save drawing')),
        );
      }
    }
  }
}

enum DrawingMode {
  pencil,
  marker,
  pen,
  eraser,
  rectangle,
  circle,
  triangle,
  line,
  polygon,
  fill, // Add this

}

class ShapeData {
  Offset start;
  Offset? end;
  List<Offset> points;
  Paint paint;
  DrawingMode mode;
  bool isFilled;
  Color fillColor;
  int sides;

  ShapeData({
    required this.start,
    this.end,
    this.points = const [],
    required this.paint,
    required this.mode,
    this.isFilled = false,
    this.fillColor = Colors.transparent,
    this.sides = 5, // Default value
  });
}

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint?> points;
  final List<ShapeData> shapes;
  final ShapeData? currentShape;
  final DrawingMode drawingMode;
  final int polygonSides; // Add this parameter

  DrawingPainter( {
    required this.points,
    this.shapes = const [],
    this.currentShape,
    required this.drawingMode,
  this.polygonSides = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw free-hand points
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i]!.offset,
          points[i + 1]!.offset,
          points[i]!.paint,
        );
      }
    }

    // Draw completed shapes
    for (final shape in shapes) {
      _drawShape(canvas, shape);
    }

    // Draw current shape
    if (currentShape != null) {
      _drawShape(canvas, currentShape!);
    }
  }

  void _drawShape(Canvas canvas, ShapeData shape) {
    if (shape.mode == DrawingMode.fill) {
      // Draw fill
      final paint = Paint()
        ..color = shape.fillColor
        ..style = PaintingStyle.fill;

      // Fill a rectangle that covers the entire visible area
      canvas.drawRect(
        const Rect.fromLTWH(0, 0, 10000, 10000),
        paint,
      );
      return;
    }

    if (shape.end == null && shape.mode != DrawingMode.fill) return;
    switch (shape.mode) {
      case DrawingMode.rectangle:
        _drawRectangle(canvas, shape);
        break;
      case DrawingMode.circle:
        _drawCircle(canvas, shape);
        break;
      case DrawingMode.triangle:
        _drawTriangle(canvas, shape);
        break;
      case DrawingMode.line:
        _drawLine(canvas, shape);
        break;
      case DrawingMode.polygon:
        _drawPolygon(canvas, shape);
        break;
      default:
        break;
    }
  }

  void _drawRectangle(Canvas canvas, ShapeData shape) {
    final rect = Rect.fromPoints(shape.start, shape.end!);
    if (shape.isFilled && shape.fillColor != Colors.transparent) {
      final fillPaint = Paint()
        ..color = shape.fillColor
        ..style = PaintingStyle.fill;
      canvas.drawRect(rect, fillPaint);
    }
    canvas.drawRect(rect, shape.paint);
  }

  void _drawCircle(Canvas canvas, ShapeData shape) {
    final center = shape.start;
    final radius = (shape.end! - center).distance;
    if (shape.isFilled && shape.fillColor != Colors.transparent) {
      final fillPaint = Paint()
        ..color = shape.fillColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, radius, fillPaint);
    }
    canvas.drawCircle(center, radius, shape.paint);
  }

  void _drawLine(Canvas canvas, ShapeData shape) {
    if (shape.isFilled && shape.fillColor != Colors.transparent) {
      final fillPaint = Paint()
        ..color = shape.fillColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = shape.paint.strokeWidth;
      canvas.drawLine(shape.start, shape.end!, fillPaint);
    }
    canvas.drawLine(shape.start, shape.end!, shape.paint);
  }

  void _drawTriangle(Canvas canvas, ShapeData shape) {
    final path = Path();
    final start = shape.start;
    final end = shape.end!;

    path.moveTo(start.dx + (end.dx - start.dx) / 2, start.dy);
    path.lineTo(start.dx, end.dy);
    path.lineTo(end.dx, end.dy);
    path.close();

    if (shape.isFilled && shape.fillColor != Colors.transparent) {
      final fillPaint = Paint()
        ..color = shape.fillColor
        ..style = PaintingStyle.fill;
      canvas.drawPath(path, fillPaint);
    }
    canvas.drawPath(path, shape.paint);
  }

  void _drawPolygon(Canvas canvas, ShapeData shape) {
    final center = shape.start;
    final end = shape.end!;

    // Calculate radius as the distance from center to end point
    final radius = (end - center).distance;

    // Calculate rotation based on the end point position
    final rotation = (end - center).direction + pi / 2;

    final path = Path();

    // Use shape.sides instead of polygonSides
    for (int i = 0; i < shape.sides; i++) {
      // Calculate angle for each point
      final angle = (i * 2 * pi / shape.sides) + rotation;

      // Calculate point position
      final point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();

    if (shape.isFilled && shape.fillColor != Colors.transparent) {
      final fillPaint = Paint()
        ..color = shape.fillColor
        ..style = PaintingStyle.fill;
      canvas.drawPath(path, fillPaint);
    }
    canvas.drawPath(path, shape.paint);
  }

    @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  final Offset offset;
  final Paint paint;

  DrawingPoint({
    required this.offset,
    required this.paint,
  });
}