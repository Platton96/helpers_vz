import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_vz/models/area_figure.dart';
import 'package:helpers_vz/models/area_question.dart';
import 'package:helpers_vz/models/figure_dimension.dart';
import 'package:helpers_vz/repositories/math_square_repository.dart';

void main() {
  final questions = [
    for (var seed = 0; seed < 50; seed++)
      ...List.generate(40, (_) => MathSquareRepository(Random(seed))).map((repository) => repository.nextQuestion()),
  ];
  final sequence = List.generate(2000, (_) => 0).fold(
    (repository: MathSquareRepository(Random(7)), questions: <AreaQuestion>[]),
    (accumulator, _) => (
      repository: accumulator.repository,
      questions: [...accumulator.questions, accumulator.repository.nextQuestion()],
    ),
  ).questions;
  final allQuestions = [...questions, ...sequence];

  List<int> valuesOf(AreaQuestion question) => question.measurements.map((measurement) => measurement.value).toList();

  bool isEasyNumber(int value) =>
      MathSquareRepository.smallNumbers.contains(value) || MathSquareRepository.roundNumbers.contains(value);

  test('generates every figure', () {
    expect(sequence.map((question) => question.figure).toSet(), AreaFigure.values.toSet());
  });

  test('the same seed gives the same question', () {
    expect(MathSquareRepository(Random(3)).nextQuestion(), MathSquareRepository(Random(3)).nextQuestion());
  });

  test('the answer matches the area formula of the figure', () {
    for (final question in allQuestions) {
      final values = valuesOf(question);
      final expected = switch (question.figure) {
        .square => values[0] * values[0],
        .rectangle || .parallelogram => values[0] * values[1],
        .triangle || .rightTriangle || .rhombus => values[0] * values[1] ~/ 2,
        .trapezoid => (values[0] + values[1]) ~/ 2 * values[2],
      };
      expect(question.answer, expected, reason: '$question');
    }
  });

  test('halved products and trapezoid midlines are whole numbers', () {
    for (final question in allQuestions) {
      final values = valuesOf(question);
      switch (question.figure) {
        case .triangle || .rightTriangle || .rhombus:
          expect((values[0] * values[1]).isEven, isTrue, reason: '$question');
        case .trapezoid:
          expect((values[0] + values[1]).isEven, isTrue, reason: '$question');
          expect(values[0], lessThan(values[1]), reason: '$question');
        case .square || .rectangle || .parallelogram:
          break;
      }
    }
  });

  test('every measurement is a number that is easy to multiply in the head', () {
    for (final question in allQuestions) {
      for (final value in valuesOf(question)) {
        expect(isEasyNumber(value) || value == 1, isTrue, reason: '$question');
      }
    }
  });

  test('never multiplies two round numbers together', () {
    for (final question in allQuestions.where((question) => question.figure != .trapezoid)) {
      final roundValues = valuesOf(question).where((value) => value >= 20 && value % 10 == 0);
      if (question.figure != .square) {
        expect(roundValues.length, lessThan(2), reason: '$question');
      }
    }
  });

  test('a rectangle has a different length and width', () {
    for (final question in allQuestions.where((question) => question.figure == .rectangle)) {
      final values = valuesOf(question);
      expect(values[0], greaterThan(values[1]), reason: '$question');
    }
  });

  test('each figure has its outline and named measurements for drawing', () {
    final expectedShape = {
      AreaFigure.square: (vertices: 4, dimensions: [FigureDimension.side]),
      AreaFigure.rectangle: (vertices: 4, dimensions: [FigureDimension.length, FigureDimension.width]),
      AreaFigure.parallelogram: (vertices: 4, dimensions: [FigureDimension.base, FigureDimension.height]),
      AreaFigure.triangle: (vertices: 3, dimensions: [FigureDimension.base, FigureDimension.height]),
      AreaFigure.rightTriangle: (vertices: 3, dimensions: [FigureDimension.leg, FigureDimension.leg]),
      AreaFigure.rhombus: (vertices: 4, dimensions: [FigureDimension.diagonal, FigureDimension.diagonal]),
      AreaFigure.trapezoid: (
        vertices: 4,
        dimensions: [FigureDimension.base, FigureDimension.base, FigureDimension.height],
      ),
    };
    for (final question in allQuestions) {
      final shape = expectedShape[question.figure];
      expect(question.outline, hasLength(shape?.vertices), reason: '$question');
      expect(
        question.measurements.map((measurement) => measurement.dimension).toList(),
        shape?.dimensions,
        reason: '$question',
      );
    }
  });

  test('heights and diagonals are drawn as auxiliary lines', () {
    for (final question in allQuestions) {
      for (final measurement in question.measurements) {
        final isInside = measurement.dimension == .height || measurement.dimension == .diagonal;
        expect(measurement.isAuxiliary, isInside, reason: '$question');
      }
    }
  });
}
