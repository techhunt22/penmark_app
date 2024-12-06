import 'package:coloring_app/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/color_constants.dart';
import '../../../constants/size_constant.dart';
import '../../models/drawing/drawing_model.dart';
import 'components/appbar.dart';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

import 'components/painter_class.dart';

class ColoringScreen extends StatefulWidget {
  const ColoringScreen({super.key});

  @override
  State<ColoringScreen> createState() => _ColoringScreenState();
}

class _ColoringScreenState extends State<ColoringScreen> {
  List<DrawingPoint?> points = [];
  List<List<DrawingPoint?>> redoHistory = [];
  bool isFilled = false;
  Color fillColor = Colors.transparent;
  // Drawing properties
  Color selectedColor = Colors.black;
  double strokeWidth = 3.0;
  DrawingMode drawingMode = DrawingMode.pencil;
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

  List<String> icons = [
    "assets/icons/png/brush.png",
    "assets/icons/png/eraser.png",
    "assets/icons/png/undo.png",
    "assets/icons/png/redo.png",
    "assets/icons/png/zoomout.png",
    "assets/icons/png/zoomin.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: CircleAvatar(
                        radius: 23,
                        backgroundColor: AppColors.lightgray,
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: AppColors.black,
                          size: 20,
                        )),
                  ),
                  Spacer(),
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
                    icon: const Icon(Icons.save),
                    onPressed: saveDrawing,
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: clearCanvas,
                  ),
                  CircleAvatar(
                      radius: 21,
                      backgroundColor: AppColors.yellowvibrant.withOpacity(0.3),
                      child: Image.asset("assets/icons/png/printicon.png")),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                      radius: 21,
                      backgroundColor: AppColors.orangesoft.withOpacity(0.3),
                      child: Image.asset("assets/icons/png/save.png")),
                ],
              ),
            ),
            SizedBox(
              height: gap1,
            ),
            Expanded(
                child: InteractiveViewer(
                  transformationController: _transformationController,
                  panEnabled: isZoomEnabled,
                  scaleEnabled: isZoomEnabled,
                  minScale: 0.5,
                  maxScale: 5.0,
                  onInteractionUpdate: (details) {

                    setState(() {

                      _currentScale = _transformationController.value.getMaxScaleOnAxis();
                    });
                  },

                  child: Stack(
                    children: [
                      RepaintBoundary(
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      RepaintBoundary(
                          child: SvgPicture.asset(
                            'assets/images/sketch.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      RepaintBoundary(
                        child: GestureDetector(
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
                      ),
                    ],
                  ),
                ),),

            Padding(
              padding: const EdgeInsets.only(left: 15,right:  15, bottom: 15),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SvgPicture.asset(
                    "assets/images/toolsbackground.svg",
                  ),
                  Container(
                    height: 130,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Drawing Tools Row
                        Row(
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
                          ],
                        ),
                        // Stroke Width Slider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
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
                        ),
                                 Expanded(
                          child: GestureDetector(
                            onTap: () => _showColorPicker(context),
                            child: SvgPicture.asset(
                                "assets/icons/svg/colorpicker.svg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildToolButton({
    required IconData icon,
    required DrawingMode mode,
    required String tooltip,
  }) {
    return Container(
      width: 46,
      height: 43,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8),
        color: drawingMode == mode ?
        AppColors.purple.withOpacity(0.4)
            : AppColors.purple.withOpacity(0.2),
      ),
      child: Tooltip(
        message: tooltip,
        child: IconButton(
          icon: Icon(
            icon,
            color: drawingMode == mode ? Colors.blue : Colors.black,
          ),
          onPressed: () => setState(() => drawingMode = mode),
        ),
      ),
    );
  }
  // Widget buttonWidget({
  //   required String img,
  //   required DrawingMode mode,
  //
  //
  // }) {
  //   return Container(
  //     width: 46,
  //     height: 43,
  //     margin: EdgeInsets.symmetric(horizontal: 4),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadiusDirectional.circular(8),
  //       color: drawingMode == mode ?
  //            AppColors.purple.withOpacity(0.4)
  //           : AppColors.purple.withOpacity(0.2),
  //     ),
  //     child: GestureDetector(
  //       onTap: () => setState(() => drawingMode = mode),
  //       child: Center(
  //         child: Image.asset(
  //           img,
  //           fit: BoxFit.scaleDown,
  //           color: drawingMode == mode ?  Colors.white : null,
  //         ),
  //       ),
  //     ),
  //   );
  // }
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





