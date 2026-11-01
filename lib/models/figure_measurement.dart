import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:helpers_vz/models/figure_dimension.dart';

part 'figure_measurement.freezed.dart';

@freezed
abstract class FigureMeasurement with _$FigureMeasurement {
  const factory FigureMeasurement({
    required FigureDimension dimension,
    required int value,
    required Point<double> start,
    required Point<double> end,
    required Point<double> labelAnchor,
    @Default(false) bool isAuxiliary,
  }) = _FigureMeasurement;
}
