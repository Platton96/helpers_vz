import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:helpers_vz/ui_kit/app_colors.dart';
import 'package:helpers_vz/ui_kit/app_text_styles.dart';

extension CanvasDrawing on Canvas {
  static const double _dashLength = 8;
  static const double _gapLength = 6;
  static const double _labelHorizontalPadding = 8;
  static const double _labelVerticalPadding = 4;
  static const Radius _labelRadius = Radius.circular(8);

  void drawDashedLine(Offset start, Offset end, Paint paint) {
    final distance = (end - start).distance;
    if (distance == 0) {
      return;
    }
    final direction = (end - start) / distance;
    for (var position = 0.0; position < distance; position += _dashLength + _gapLength) {
      drawLine(start + direction * position, start + direction * min(position + _dashLength, distance), paint);
    }
  }

  void drawLabelChip(String text, Offset anchor, {TextStyle? style, Offset alignment = Offset.zero}) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style ?? AppTextStyles.figureLabel),
      textDirection: .ltr,
    )..layout();
    final width = textPainter.width + _labelHorizontalPadding * 2;
    final height = textPainter.height + _labelVerticalPadding * 2;
    final center = anchor + Offset(alignment.dx * width / 2, alignment.dy * height / 2);
    drawRRect(
      .fromRectAndRadius(Rect.fromCenter(center: center, width: width, height: height), _labelRadius),
      Paint()..color = AppColors.figureLabelBackground,
    );
    textPainter
      ..paint(this, center - Offset(textPainter.width / 2, textPainter.height / 2))
      ..dispose();
  }

  void drawPlainText(String text, Offset center, TextStyle style) {
    final textPainter = TextPainter(text: TextSpan(text: text, style: style), textDirection: .ltr)..layout();
    textPainter
      ..paint(this, center - Offset(textPainter.width / 2, textPainter.height / 2))
      ..dispose();
  }
}
