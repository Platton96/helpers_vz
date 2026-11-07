import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:helpers_vz/models/graph_viewport.dart';

part 'function_graph.freezed.dart';

@freezed
abstract class FunctionGraph with _$FunctionGraph {
  const factory FunctionGraph({
    required GraphViewport viewport,
    required List<List<Point<double>>> segments,
    required Point<double> markedPoint,
    required String markedXLabel,
    required String markedYLabel,
  }) = _FunctionGraph;
}
