import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_vz/models/equation_kind.dart';
import 'package:helpers_vz/models/equation_question.dart';
import 'package:helpers_vz/models/function_graph.dart';
import 'package:helpers_vz/repositories/math_equation_repository.dart';

void main() {
  final repository = MathEquationRepository(Random(11));
  List<EquationQuestion> questionsOf(EquationKind kind) => List.generate(300, (_) => repository.questionOf(kind));

  double evaluate(String expression, double x) => _Evaluator(expression, x).parse();

  ({double left, double right}) sides(String equation, double x) {
    final [left, right] = equation.split('=');
    return (left: evaluate(left, x), right: evaluate(right, x));
  }

  ({double leading, double middle, double constant}) coefficients(String equation) {
    double at(double x) => sides(equation, x).left;
    final constant = at(0);
    return (leading: (at(1) + at(-1)) / 2 - constant, middle: (at(1) - at(-1)) / 2, constant: constant);
  }

  bool isOnCurve(FunctionGraph graph) => graph.segments
      .expand((segment) => segment)
      .any((point) => (point.x - graph.markedPoint.x).abs() < 0.03 && (point.y - graph.markedPoint.y).abs() < 0.1);

  test('the same seed gives the same question', () {
    expect(MathEquationRepository(Random(3)).nextQuestion(), MathEquationRepository(Random(3)).nextQuestion());
  });

  test('generates every kind of question', () {
    final generator = MathEquationRepository(Random(2));
    final types = List.generate(300, (_) => generator.nextQuestion().runtimeType).toSet();
    expect(types, hasLength(EquationKind.values.length));
  });

  test('a linear equation holds for its whole root', () {
    for (final question in questionsOf(.linear)) {
      final LinearEquationQuestion(:equation, :root) = question as LinearEquationQuestion;
      final (:left, :right) = sides(equation, root.toDouble());
      expect(left, closeTo(right, 1e-9), reason: equation);
      expect(root, inInclusiveRange(-9, 15), reason: equation);
    }
  });

  test('a discriminant question has small coefficients and the right discriminant', () {
    for (final question in questionsOf(.discriminant)) {
      final DiscriminantQuestion(:equation, :discriminant) = question as DiscriminantQuestion;
      final (:leading, :middle, :constant) = coefficients(equation);
      expect(middle.abs(), inInclusiveRange(1, 10), reason: equation);
      expect(leading.abs(), inInclusiveRange(1, 5), reason: equation);
      expect(constant.abs(), inInclusiveRange(1, 9), reason: equation);
      expect(discriminant, middle * middle - 4 * leading * constant, reason: equation);
    }
  });

  test('a root count question uses big coefficients and counts roots by the discriminant', () {
    final counts = <int>{};
    for (final question in questionsOf(.rootCount)) {
      final RootCountQuestion(:equation, :rootCount) = question as RootCountQuestion;
      final (:leading, :middle, :constant) = coefficients(equation);
      final discriminant = middle * middle - 4 * leading * constant;
      expect(rootCount, switch (discriminant) { > 0 => 2, 0 => 1, _ => 0 }, reason: equation);
      expect(leading, greaterThanOrEqualTo(9), reason: equation);
      counts.add(rootCount);
    }
    expect(counts, {0, 1, 2});
  });

  test('a roots question gives its discriminant and two whole roots in order', () {
    for (final question in questionsOf(.roots)) {
      final RootsQuestion(:equation, :discriminant, :smallerRoot, :largerRoot) = question as RootsQuestion;
      final (:leading, :middle, :constant) = coefficients(equation);
      expect(smallerRoot, lessThan(largerRoot), reason: equation);
      expect(discriminant, middle * middle - 4 * leading * constant, reason: equation);
      for (final root in [smallerRoot, largerRoot]) {
        expect(sides(equation, root.toDouble()).left, closeTo(0, 1e-9), reason: equation);
      }
    }
  });

  test('a formula question has four different formulas and a whole marked point on the graph', () {
    for (final question in questionsOf(.formulaByGraph)) {
      final FormulaByGraphQuestion(:graph, :formulas, :correctIndex) = question as FormulaByGraphQuestion;
      expect(formulas.toSet(), hasLength(MathEquationRepository.optionCount), reason: '$formulas');
      expect(correctIndex, inInclusiveRange(0, MathEquationRepository.optionCount - 1));
      expect(graph.markedPoint.y, graph.markedPoint.y.roundToDouble());
      expect(graph.markedPoint.y, isNot(0));
      expect(graph.markedPoint.x, isNot(0));
      expect(isOnCurve(graph), isTrue, reason: '$formulas ${graph.markedPoint}');
    }
  });

  test('a graph question has four different graphs, each with its marked point on it', () {
    for (final question in questionsOf(.graphByFormula)) {
      final GraphByFormulaQuestion(:formula, :graphs, :correctIndex) = question as GraphByFormulaQuestion;
      expect(graphs, hasLength(MathEquationRepository.optionCount), reason: formula);
      expect(graphs.map((graph) => graph.segments).toSet(), hasLength(MathEquationRepository.optionCount));
      expect(correctIndex, inInclusiveRange(0, MathEquationRepository.optionCount - 1));
      for (final graph in graphs) {
        expect(graph.markedPoint.y, graph.markedPoint.y.roundToDouble(), reason: formula);
        expect(isOnCurve(graph), isTrue, reason: '$formula ${graph.markedPoint}');
      }
    }
  });
}

class _Evaluator {
  final List<String> _tokens;
  final double _x;
  int _position = 0;

  _Evaluator(String expression, this._x)
      : _tokens = RegExp(r'\d+|[x²()+−]').allMatches(expression).map((match) => match.group(0) ?? '').toList();

  String? get _current => _position < _tokens.length ? _tokens[_position] : null;

  double parse() {
    var value = _term();
    while (_current == '+' || _current == '−') {
      final operator = _tokens[_position++];
      value = operator == '+' ? value + _term() : value - _term();
    }
    return value;
  }

  double _term() {
    var sign = 1.0;
    if (_current == '−') {
      _position++;
      sign = -1;
    }
    var value = _factor();
    while (_current != null && _current != '+' && _current != '−' && _current != ')') {
      value *= _factor();
    }
    return sign * value;
  }

  double _factor() {
    final token = _tokens[_position++];
    var value = switch (token) {
      'x' => _x,
      '(' => _closed(parse()),
      _ => double.parse(token),
    };
    if (_current == '²') {
      _position++;
      value *= value;
    }
    return value;
  }

  double _closed(double value) {
    _position++;
    return value;
  }
}
