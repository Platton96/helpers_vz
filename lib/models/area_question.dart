import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:helpers_vz/models/area_figure.dart';
import 'package:helpers_vz/models/figure_measurement.dart';

part 'area_question.freezed.dart';

@freezed
abstract class AreaQuestion with _$AreaQuestion {
  const factory AreaQuestion({
    required AreaFigure figure,
    required List<Point<double>> outline,
    required List<FigureMeasurement> measurements,
    required int answer,
  }) = _AreaQuestion;
}
