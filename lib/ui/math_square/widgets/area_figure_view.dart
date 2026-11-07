import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helpers_vz/models/figure_measurement.dart';
import 'package:helpers_vz/ui_kit/app_colors.dart';
import 'package:helpers_vz/ui_kit/canvas_drawing.dart';

class AreaFigureView extends StatelessWidget {
  final List<Point<double>> outline;
  final List<FigureMeasurement> measurements;

  const AreaFigureView({super.key, required this.outline, required this.measurements});

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size.infinite,
        painter: _AreaFigurePainter(outline: outline, measurements: measurements),
      );
}

class _AreaFigurePainter extends CustomPainter {
  static const double _padding = 32;
  static const double _strokeWidth = 3;
  static const double _auxiliaryWidth = 2;

  final List<Point<double>> outline;
  final List<FigureMeasurement> measurements;

  _AreaFigurePainter({required this.outline, required this.measurements});

  @override
  void paint(Canvas canvas, Size size) {
    final points = [...outline, ...measurements.map((measurement) => measurement.labelAnchor)];
    if (points.isEmpty) {
      return;
    }
    final minX = points.map((point) => point.x).reduce(min);
    final maxX = points.map((point) => point.x).reduce(max);
    final minY = points.map((point) => point.y).reduce(min);
    final maxY = points.map((point) => point.y).reduce(max);
    final spanX = max(maxX - minX, 0.01);
    final spanY = max(maxY - minY, 0.01);
    final scale = max(min((size.width - _padding * 2) / spanX, (size.height - _padding * 2) / spanY), 0.0);
    final originX = (size.width - spanX * scale) / 2;
    final originY = (size.height - spanY * scale) / 2;
    Offset toCanvas(Point<double> point) =>
        Offset(originX + (point.x - minX) * scale, originY + (point.y - minY) * scale);

    final path = Path()..addPolygon(outline.map(toCanvas).toList(), true);
    canvas
      ..drawPath(path, Paint()..color = AppColors.figureFill)
      ..drawPath(
        path,
        Paint()
          ..color = AppColors.accent
          ..style = .stroke
          ..strokeWidth = _strokeWidth
          ..strokeJoin = .round,
      );

    final auxiliaryPaint = Paint()
      ..color = AppColors.textSecondary
      ..strokeWidth = _auxiliaryWidth;
    for (final measurement in measurements.where((measurement) => measurement.isAuxiliary)) {
      canvas.drawDashedLine(toCanvas(measurement.start), toCanvas(measurement.end), auxiliaryPaint);
    }

    for (final measurement in measurements) {
      canvas.drawLabelChip('${measurement.value}', toCanvas(measurement.labelAnchor));
    }
  }

  @override
  bool shouldRepaint(_AreaFigurePainter oldDelegate) =>
      oldDelegate.outline != outline || oldDelegate.measurements != measurements;
}
