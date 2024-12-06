import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/drawing/drawing_model.dart';
import 'components/painter_class.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  State<DrawingPage> createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  // Drawing points and history management
  List<DrawingPoint?> points = [];
  List<List<DrawingPoint?>> redoHistory = [];
  bool isFilled = false;
  Color fillColor = Colors.transparent;
  // Drawing properties
  Color selectedColor = Colors.black;
  double strokeWidth = 3.0;
  DrawingMode drawingMode = DrawingMode.pencil;
  String? svgPath;
  final _eraserPaint = Paint()
    ..blendMode = BlendMode.clear
    ..strokeWidth = 3.0
    ..strokeCap = StrokeCap.round;
  final GlobalKey _canvasKey = GlobalKey();


  bool isZoomEnabled = false;
  final TransformationController _transformationController = TransformationController();
  double _currentScale = 1.0;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }
  void _resetZoom() {
    setState(() {
      _transformationController.value = Matrix4.identity();
      _currentScale = 1.0;
    });
  }
  Offset _getLocalPosition(Offset position) {
    final RenderBox renderBox = _canvasKey.currentContext?.findRenderObject() as RenderBox;
    return renderBox.globalToLocal(position);
  }

  Future<void> pickSvg() async {
    // Implement file picking logic here
    // For now, let's assume you have an SVG in your assets
    setState(() {
      svgPath = 'assets/images/sketch.svg'; // Replace with your SVG path
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(
            icon: Icon(
              isZoomEnabled ?  Icons.edit:Icons.zoom_in,
              color: isZoomEnabled ?   Colors.black:Colors.blue,
            ),
            onPressed: () {
              setState(() {
                isZoomEnabled = !isZoomEnabled;
                // Remove the reset code from here to maintain zoom level
              });
            },
            tooltip: isZoomEnabled ? 'Drawing Mode' : 'Zoom Mode',
          ),
          // Optional: Add a separate reset zoom button
          IconButton(
            icon: const Icon(Icons.center_focus_strong),
            onPressed: _resetZoom,
            tooltip: 'Reset Zoom',
          ),
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: pickSvg,
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: points.isNotEmpty  ? undo : null,
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            onPressed: redoHistory.isNotEmpty
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
          InteractiveViewer(
            transformationController: _transformationController,
            panEnabled: isZoomEnabled, // Only pan when in zoom mode
            scaleEnabled: isZoomEnabled, // Only zoom when in zoom mode
            minScale: 0.5,
            maxScale: 5.0,
            onInteractionUpdate: (details) {
              setState(() {
                _currentScale = _transformationController.value.getMaxScaleOnAxis();
              });
            },
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                ),
                if (svgPath != null)
                  SvgPicture.asset(
                    svgPath!,
                    fit: BoxFit.contain,
                  ),
                GestureDetector(
                  key: _canvasKey,
                  onTapDown: !isZoomEnabled ? (details) {
                    if (drawingMode == DrawingMode.fill) {
                      _floodFill(_getLocalPosition(details.globalPosition));
                    }
                  } : null,
                  onPanStart: !isZoomEnabled ? (details) {
                    setState(() {
                      redoHistory.clear();
                      // Add a null point if the last point wasn't null
                      if (points.isNotEmpty && points.last != null) {
                        points.add(null);
                      }
                      if (drawingMode == DrawingMode.fill) {
                        _floodFill(_getLocalPosition(details.globalPosition));
                        return;
                      } else {
                        points.add(
                          DrawingPoint(
                            offset: _getLocalPosition(details.globalPosition),
                            paint: _getPaintForMode(drawingMode),
                          ),
                        );
                      }
                    });
                  } : null,

                  onPanUpdate: !isZoomEnabled ? (details) {
                    setState(() {
                      points.add(
                        DrawingPoint(
                          offset: _getLocalPosition(details.globalPosition),
                          paint: _getPaintForMode(drawingMode), // Use the new method
                        ),
                      );
                    });
                  } : null,
                  onPanEnd: !isZoomEnabled ? (details) {
                    setState(() {
                      points.add(null);
                    });
                  } : null,
                  child: CustomPaint(
                    painter: DrawingPainter(
                      points: points,
                      drawingMode: drawingMode,
                    ),
                    size: Size.infinite,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
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


                        const SizedBox(width: 10),

                        // Add the new code here ↓

                          // Fill color picker (only visible when fill is enabled)

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

                  ]  ),
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


    setState(() {

      redoHistory.clear();
    });
  }

  Paint _getPaintForMode(DrawingMode mode) {
    switch (mode) {
      case DrawingMode.pencil:
        return Paint()
          ..color = selectedColor
          ..isAntiAlias = true
          ..strokeWidth = strokeWidth / _currentScale
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;
      case DrawingMode.marker:
        return Paint()
          ..color = selectedColor.withOpacity(0.5) // Semi-transparent
          ..isAntiAlias = true
          ..strokeWidth = strokeWidth * 2 / _currentScale // Thicker line
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;
      case DrawingMode.pen:
        return Paint()
          ..color = selectedColor
          ..isAntiAlias = true
          ..strokeWidth = strokeWidth / 2 / _currentScale // Thinner line
          ..strokeCap = StrokeCap.square // Square cap for pen
          ..style = PaintingStyle.stroke;
      case DrawingMode.eraser:
        return _eraserPaint.copyWith(strokeWidth: strokeWidth / _currentScale);
      default:
        return Paint()
          ..color = selectedColor
          ..isAntiAlias = true
          ..strokeWidth = strokeWidth / _currentScale
          ..strokeCap = StrokeCap.round;
    }
  }

  void undo() {
    if (points.isEmpty) return;
    setState(() {
      List<DrawingPoint?> stroke = [];
      // Remove points until we hit a null (end of previous stroke)
      while (points.isNotEmpty && points.last != null) {
        stroke.add(points.removeLast());
      }
      // Remove the null marker
      if (points.isNotEmpty) {
        points.removeLast(); // Just remove the null, don't add it to stroke
      }
      if (stroke.isNotEmpty) {
        // Add null at the start of the stored stroke to maintain separation
        stroke.add(null);
        redoHistory.add(stroke.reversed.toList());
      }
    });
  }

  void redo() {
    if (redoHistory.isEmpty) return;
    setState(() {
      List<DrawingPoint?> stroke = redoHistory.removeLast();
      if (stroke.isNotEmpty) {
        // Add a null before adding the stroke if points is not empty
        if (points.isNotEmpty && points.last != null) {
          points.add(null);
        }
        points.addAll(stroke);
      }
    });
  }

  // Update the clear canvas method
  void clearCanvas() {
    setState(() {
      points.clear();
      redoHistory.clear();

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

extension PaintCopy on Paint {
  Paint copyWith({double? strokeWidth}) {
    return Paint()
      ..blendMode = blendMode
      ..strokeWidth = strokeWidth ?? this.strokeWidth
      ..strokeCap = strokeCap
      ..color = color
      ..isAntiAlias = isAntiAlias;
  }
}




