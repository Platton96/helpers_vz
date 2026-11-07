import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helpers_vz/models/function_graph.dart';
import 'package:helpers_vz/ui_kit/app_colors.dart';
import 'package:helpers_vz/ui_kit/app_text_styles.dart';
import 'package:helpers_vz/ui_kit/canvas_drawing.dart';

class FunctionGraphView extends StatelessWidget {
  final FunctionGraph graph;
  final String horizontalAxisLabel;
  final String verticalAxisLabel;

  const FunctionGraphView({
    super.key,
    required this.graph,
    required this.horizontalAxisLabel,
    required this.verticalAxisLabel,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size.infinite,
        painter: _FunctionGraphPainter(
          graph: graph,
          horizontalAxisLabel: horizontalAxisLabel,
          verticalAxisLabel: verticalAxisLabel,
        ),
      );
}

class _FunctionGraphPainter extends CustomPainter {
  static const double _padding = 12;
  static const double _curveWidth = 3;
  static const double _axisWidth = 1.5;
  static const double _arrowSize = 6;
  static const double _markRadius = 5;
  static const double _labelGap = 6;

  final FunctionGraph graph;
  final String horizontalAxisLabel;
  final String verticalAxisLabel;

  _FunctionGraphPainter({required this.graph, required this.horizontalAxisLabel, required this.verticalAxisLabel});

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width - _padding * 2;
    final height = size.height - _padding * 2;
    if (width <= 0 || height <= 0) {
      return;
    }
    final viewport = graph.viewport;
    Offset toCanvas(Point<double> point) => Offset(
          _padding + (point.x - viewport.minX) / (viewport.maxX - viewport.minX) * width,
          _padding + (viewport.maxY - point.y) / (viewport.maxY - viewport.minY) * height,
        );

    canvas
      ..save()
      ..clipRect(Offset.zero & size);

    final gridPaint = Paint()
      ..color = AppColors.graphGrid
      ..strokeWidth = 1;
    for (var step = (viewport.minX / viewport.gridStepX).ceil(); step * viewport.gridStepX <= viewport.maxX; step++) {
      final x = step * viewport.gridStepX;
      canvas.drawLine(toCanvas(Point(x, viewport.minY)), toCanvas(Point(x, viewport.maxY)), gridPaint);
    }
    for (var y = viewport.minY.ceil(); y <= viewport.maxY; y++) {
      canvas.drawLine(toCanvas(Point(viewport.minX, y.toDouble())), toCanvas(Point(viewport.maxX, y.toDouble())), gridPaint);
    }

    final right = toCanvas(Point(viewport.maxX, 0.0));
    final top = toCanvas(Point(0.0, viewport.maxY));
    final axisPaint = Paint()
      ..color = AppColors.graphAxis
      ..strokeWidth = _axisWidth
      ..strokeCap = .round;
    canvas
      ..drawLine(toCanvas(Point(viewport.minX, 0.0)), right, axisPaint)
      ..drawLine(toCanvas(Point(0.0, viewport.minY)), top, axisPaint)
      ..drawLine(right, right + const Offset(-_arrowSize, -_arrowSize), axisPaint)
      ..drawLine(right, right + const Offset(-_arrowSize, _arrowSize), axisPaint)
      ..drawLine(top, top + const Offset(-_arrowSize, _arrowSize), axisPaint)
      ..drawLine(top, top + const Offset(_arrowSize, _arrowSize), axisPaint)
      ..drawPlainText(horizontalAxisLabel, right + const Offset(-_arrowSize, 16), AppTextStyles.graphAxis)
      ..drawPlainText(verticalAxisLabel, top + const Offset(14, _arrowSize), AppTextStyles.graphAxis);

    final curvePaint = Paint()
      ..color = AppColors.accent
      ..style = .stroke
      ..strokeWidth = _curveWidth
      ..strokeJoin = .round
      ..strokeCap = .round;
    for (final segment in graph.segments) {
      canvas.drawPath(Path()..addPolygon(segment.map(toCanvas).toList(), false), curvePaint);
    }

    final mark = graph.markedPoint;
    final markOffset = toCanvas(mark);
    final footX = toCanvas(Point(mark.x, 0.0));
    final footY = toCanvas(Point(0.0, mark.y));
    final markPaint = Paint()
      ..color = AppColors.graphMark
      ..strokeWidth = _axisWidth;
    canvas
      ..drawDashedLine(markOffset, footX, markPaint)
      ..drawDashedLine(markOffset, footY, markPaint)
      ..drawCircle(markOffset, _markRadius, markPaint)
      ..drawLabelChip(
        graph.markedXLabel,
        footX + Offset(0, mark.y > 0 ? _labelGap : -_labelGap),
        style: AppTextStyles.graphLabel,
        alignment: Offset(0, mark.y > 0 ? 1 : -1),
      )
      ..drawLabelChip(
        graph.markedYLabel,
        footY + Offset(mark.x > 0 ? -_labelGap : _labelGap, 0),
        style: AppTextStyles.graphLabel,
        alignment: Offset(mark.x > 0 ? -1 : 1, 0),
      )
      ..restore();
  }

  @override
  bool shouldRepaint(_FunctionGraphPainter oldDelegate) =>
      oldDelegate.graph != graph ||
      oldDelegate.horizontalAxisLabel != horizontalAxisLabel ||
      oldDelegate.verticalAxisLabel != verticalAxisLabel;
}
