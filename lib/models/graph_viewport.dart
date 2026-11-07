import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_viewport.freezed.dart';

@freezed
abstract class GraphViewport with _$GraphViewport {
  const factory GraphViewport({
    required double minX,
    required double maxX,
    required double minY,
    required double maxY,
    required double gridStepX,
  }) = _GraphViewport;
}
