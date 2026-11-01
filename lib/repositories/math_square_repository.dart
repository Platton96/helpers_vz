import 'dart:math';

import 'package:helpers_vz/models/area_figure.dart';
import 'package:helpers_vz/models/area_question.dart';
import 'package:helpers_vz/models/figure_measurement.dart';

class MathSquareRepository {
  static const List<int> smallNumbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  static const List<int> roundNumbers = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500];
  static const List<int> _roundFactors = [2, 3, 4, 5, 6, 7, 8, 9];
  static const List<int> _roundSquareSides = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300];
  static const List<int> _roundHeights = [10, 20, 30, 40, 50, 60, 70, 80, 90];
  static const List<int> _trapezoidMidlines = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  static const double _labelOffset = 0.12;

  final Random _random;

  MathSquareRepository(this._random);

  AreaQuestion nextQuestion() => switch (_pick(AreaFigure.values)) {
        .square => _square(),
        .rectangle => _rectangle(),
        .parallelogram => _parallelogram(),
        .triangle => _triangle(),
        .rightTriangle => _rightTriangle(),
        .rhombus => _rhombus(),
        .trapezoid => _trapezoid(),
      };

  AreaQuestion _square() {
    final side = _random.nextInt(4) == 0 ? _pick(_roundSquareSides) : _pick(smallNumbers);

    return AreaQuestion(
      figure: .square,
      answer: side * side,
      outline: const [Point(0.0, 0.0), Point(1.0, 0.0), Point(1.0, 1.0), Point(0.0, 1.0)],
      measurements: [
        FigureMeasurement(
          dimension: .side,
          value: side,
          start: const Point(0.0, 1.0),
          end: const Point(1.0, 1.0),
          labelAnchor: const Point(0.5, 1 + _labelOffset),
        ),
      ],
    );
  }

  AreaQuestion _rectangle() {
    final (first, second) = _easyPair(isDistinctRequired: true);
    final length = max(first, second);
    final width = min(first, second);
    final height = _ratio(width, length, 0.4, 0.75);

    return AreaQuestion(
      figure: .rectangle,
      answer: length * width,
      outline: [const Point(0.0, 0.0), const Point(1.0, 0.0), Point(1.0, height), Point(0.0, height)],
      measurements: [
        FigureMeasurement(
          dimension: .length,
          value: length,
          start: Point(0.0, height),
          end: Point(1.0, height),
          labelAnchor: Point(0.5, height + _labelOffset),
        ),
        FigureMeasurement(
          dimension: .width,
          value: width,
          start: const Point(1.0, 0.0),
          end: Point(1.0, height),
          labelAnchor: Point(1 + _labelOffset, height / 2),
        ),
      ],
    );
  }

  AreaQuestion _parallelogram() {
    final (base, height) = _easyPair();
    final drawnHeight = _ratio(height, base, 0.45, 0.9);
    const shift = 0.3;

    return AreaQuestion(
      figure: .parallelogram,
      answer: base * height,
      outline: [
        const Point(shift, 0.0),
        const Point(1 + shift, 0.0),
        Point(1.0, drawnHeight),
        Point(0.0, drawnHeight),
      ],
      measurements: [
        FigureMeasurement(
          dimension: .base,
          value: base,
          start: Point(0.0, drawnHeight),
          end: Point(1.0, drawnHeight),
          labelAnchor: Point(0.5, drawnHeight + _labelOffset),
        ),
        FigureMeasurement(
          dimension: .height,
          value: height,
          start: const Point(shift, 0.0),
          end: Point(shift, drawnHeight),
          labelAnchor: Point(shift + _labelOffset, drawnHeight / 2),
          isAuxiliary: true,
        ),
      ],
    );
  }

  AreaQuestion _triangle() {
    final (base, height) = _easyPair(isEvenProductRequired: true);
    final drawnHeight = _ratio(height, base, 0.5, 0.9);
    const apexX = 0.35;

    return AreaQuestion(
      figure: .triangle,
      answer: base * height ~/ 2,
      outline: [const Point(apexX, 0.0), Point(1.0, drawnHeight), Point(0.0, drawnHeight)],
      measurements: [
        FigureMeasurement(
          dimension: .base,
          value: base,
          start: Point(0.0, drawnHeight),
          end: Point(1.0, drawnHeight),
          labelAnchor: Point(0.5, drawnHeight + _labelOffset),
        ),
        FigureMeasurement(
          dimension: .height,
          value: height,
          start: const Point(apexX, 0.0),
          end: Point(apexX, drawnHeight),
          labelAnchor: Point(apexX + _labelOffset, drawnHeight * 0.6),
          isAuxiliary: true,
        ),
      ],
    );
  }

  AreaQuestion _rightTriangle() {
    final (horizontalLeg, verticalLeg) = _easyPair(isEvenProductRequired: true);
    final drawnHeight = _ratio(verticalLeg, horizontalLeg, 0.5, 1.3);

    return AreaQuestion(
      figure: .rightTriangle,
      answer: horizontalLeg * verticalLeg ~/ 2,
      outline: [const Point(0.0, 0.0), Point(0.0, drawnHeight), Point(1.0, drawnHeight)],
      measurements: [
        FigureMeasurement(
          dimension: .leg,
          value: verticalLeg,
          start: const Point(0.0, 0.0),
          end: Point(0.0, drawnHeight),
          labelAnchor: Point(-_labelOffset, drawnHeight / 2),
        ),
        FigureMeasurement(
          dimension: .leg,
          value: horizontalLeg,
          start: Point(0.0, drawnHeight),
          end: Point(1.0, drawnHeight),
          labelAnchor: Point(0.5, drawnHeight + _labelOffset),
        ),
      ],
    );
  }

  AreaQuestion _rhombus() {
    final (horizontalDiagonal, verticalDiagonal) = _easyPair(isEvenProductRequired: true);
    final drawnHeight = _ratio(verticalDiagonal, horizontalDiagonal, 0.6, 1.4);
    final middleY = drawnHeight / 2;

    return AreaQuestion(
      figure: .rhombus,
      answer: horizontalDiagonal * verticalDiagonal ~/ 2,
      outline: [Point(0.0, middleY), const Point(0.5, 0.0), Point(1.0, middleY), Point(0.5, drawnHeight)],
      measurements: [
        FigureMeasurement(
          dimension: .diagonal,
          value: horizontalDiagonal,
          start: Point(0.0, middleY),
          end: Point(1.0, middleY),
          labelAnchor: Point(0.27, middleY + _labelOffset * 0.7),
          isAuxiliary: true,
        ),
        FigureMeasurement(
          dimension: .diagonal,
          value: verticalDiagonal,
          start: const Point(0.5, 0.0),
          end: Point(0.5, drawnHeight),
          labelAnchor: Point(0.5 + _labelOffset, drawnHeight * 0.27),
          isAuxiliary: true,
        ),
      ],
    );
  }

  AreaQuestion _trapezoid() {
    final midline = _pick(_trapezoidMidlines);
    final difference = 1 + _random.nextInt(min(midline - 1, smallNumbers.last - midline));
    final topBase = midline - difference;
    final bottomBase = midline + difference;
    final height = _random.nextInt(5) == 0 ? _pick(_roundHeights) : _pick(smallNumbers);
    final topWidth = _ratio(topBase, bottomBase, 0.3, 0.75);
    final drawnHeight = _ratio(height, bottomBase, 0.4, 0.75);
    final left = (1 - topWidth) * 0.35;

    return AreaQuestion(
      figure: .trapezoid,
      answer: midline * height,
      outline: [Point(left, 0.0), Point(left + topWidth, 0.0), Point(1.0, drawnHeight), Point(0.0, drawnHeight)],
      measurements: [
        FigureMeasurement(
          dimension: .base,
          value: topBase,
          start: Point(left, 0.0),
          end: Point(left + topWidth, 0.0),
          labelAnchor: Point(left + topWidth / 2, -_labelOffset),
        ),
        FigureMeasurement(
          dimension: .base,
          value: bottomBase,
          start: Point(0.0, drawnHeight),
          end: Point(1.0, drawnHeight),
          labelAnchor: Point(0.5, drawnHeight + _labelOffset),
        ),
        FigureMeasurement(
          dimension: .height,
          value: height,
          start: Point(left, 0.0),
          end: Point(left, drawnHeight),
          labelAnchor: Point(left + _labelOffset, drawnHeight / 2),
          isAuxiliary: true,
        ),
      ],
    );
  }

  (int, int) _easyPair({bool isEvenProductRequired = false, bool isDistinctRequired = false}) {
    while (true) {
      final (first, second) = _random.nextInt(10) < 7 ? (_pick(smallNumbers), _pick(smallNumbers)) : _roundPair();
      final isEvenEnough = !isEvenProductRequired || (first * second).isEven;
      final isDistinctEnough = !isDistinctRequired || first != second;
      if (isEvenEnough && isDistinctEnough) {
        return (first, second);
      }
    }
  }

  (int, int) _roundPair() {
    final factor = _pick(_roundFactors);
    final round = _pick(roundNumbers);

    return _random.nextBool() ? (factor, round) : (round, factor);
  }

  double _ratio(int value, int reference, double lowest, double highest) =>
      (value / reference).clamp(lowest, highest).toDouble();

  T _pick<T>(List<T> values) => values[_random.nextInt(values.length)];
}
