import 'dart:math';

import 'package:helpers_vz/managers/math_notation.dart';
import 'package:helpers_vz/models/equation_kind.dart';
import 'package:helpers_vz/models/equation_question.dart';
import 'package:helpers_vz/models/function_graph.dart';
import 'package:helpers_vz/models/graph_viewport.dart';

class MathEquationRepository {
  static const GraphViewport plainViewport = GraphViewport(minX: -6, maxX: 6, minY: -6, maxY: 6, gridStepX: 1);
  static const GraphViewport waveViewport = GraphViewport(minX: -7, maxX: 7, minY: -4, maxY: 4, gridStepX: pi / 2);
  static const int optionCount = 4;
  static const int _sampleCount = 240;
  static const double _tolerance = 1e-6;
  static const String _minus = MathNotation.minus;
  static final List<_MarkCandidate> _integerCandidates = [
    for (var x = -5; x <= 5; x++)
      if (x != 0) _MarkCandidate(x.toDouble(), MathNotation.number(x)),
  ];
  static final List<_MarkCandidate> _waveCandidates = [
    for (var halves = -4; halves <= 4; halves++)
      if (halves != 0) _MarkCandidate(halves * pi / 2, _piLabel(halves)),
  ];

  final Random _random;

  MathEquationRepository(this._random);

  EquationQuestion nextQuestion() => questionOf(_pick(EquationKind.values));

  EquationQuestion questionOf(EquationKind kind) => switch (kind) {
        .linear => _linear(),
        .discriminant => _discriminant(),
        .rootCount => _rootCount(),
        .roots => _roots(),
        .formulaByGraph => _formulaByGraph(),
        .graphByFormula => _graphByFormula(),
      };

  static String _piLabel(int halves) {
    final sign = halves < 0 ? _minus : '';
    final magnitude = halves.abs();
    return switch (magnitude) {
      1 => '$signπ/2',
      2 => '$signπ',
      _ when magnitude.isEven => '$sign${magnitude ~/ 2}π',
      _ => '$sign$magnitudeπ/2',
    };
  }

  EquationQuestion _linear() {
    final root = _nonZeroBetween(-9, 15);
    final coefficient = _between(2, 9);
    final equation = switch (_random.nextInt(4)) {
      0 => _linearWithConstant(coefficient, root),
      1 => _linearWithBrackets(coefficient, root),
      2 => _linearOnBothSides(coefficient, root),
      _ => _linearSubtracted(coefficient, root),
    };
    return LinearEquationQuestion(equation: equation, root: root);
  }

  String _linearWithConstant(int coefficient, int root) {
    final constant = _nonZeroBetween(-20, 20);
    return '${_polynomial([(coefficient, 'x'), (constant, '')])} = ${MathNotation.number(coefficient * root + constant)}';
  }

  String _linearWithBrackets(int coefficient, int root) {
    final shift = _nonZeroBetween(-12, 12);
    return '$coefficient(${_shifted(shift)}) = ${MathNotation.number(coefficient * (root - shift))}';
  }

  String _linearOnBothSides(int coefficient, int root) {
    final rightCoefficient = _pick([for (var value = 1; value <= 9; value++) if (value != coefficient) value]);
    final constant = _nonZeroBetween(-20, 20);
    final rightConstant = coefficient * root + constant - rightCoefficient * root;
    return '${_polynomial([(coefficient, 'x'), (constant, '')])} = '
        '${_polynomial([(rightCoefficient, 'x'), (rightConstant, '')])}';
  }

  String _linearSubtracted(int coefficient, int root) {
    final constant = _between(10, 40);
    return '$constant $_minus ${coefficient}x = ${MathNotation.number(constant - coefficient * root)}';
  }

  EquationQuestion _discriminant() {
    final leading = _between(1, 5) * (_random.nextInt(4) == 0 ? -1 : 1);
    final middle = _nonZeroBetween(-10, 10);
    final constant = _nonZeroBetween(-9, 9);
    return DiscriminantQuestion(
      equation: _quadratic(leading, middle, constant),
      discriminant: middle * middle - 4 * leading * constant,
    );
  }

  EquationQuestion _rootCount() {
    final rootCount = _random.nextInt(3);
    final (leading, middle, constant) = rootCount == 1 ? _perfectSquare() : _estimated(rootCount);
    return RootCountQuestion(equation: _quadratic(leading, middle, constant), rootCount: rootCount);
  }

  (int, int, int) _perfectSquare() {
    final outer = _between(3, 12);
    final inner = _between(2, 15);
    return (outer * outer, 2 * outer * inner * _sign(), inner * inner);
  }

  (int, int, int) _estimated(int rootCount) {
    final leading = _between(11, 99);
    final constant = _between(11, 99);
    final (lowest, highest) = rootCount == 2 ? (1.3, 3.0) : (0.25, 0.75);
    final ratio = lowest + _random.nextDouble() * (highest - lowest);
    final middle = sqrt(4 * leading * constant * ratio).round();
    return (leading, middle * _sign(), constant);
  }

  EquationQuestion _roots() {
    final first = _between(-9, 9);
    final second = _pick([for (var value = -9; value <= 9; value++) if (value != first) value]);
    final leading = _pick(const [1, 1, 1, 1, 2, 3, -1]);
    final difference = first - second;
    return RootsQuestion(
      equation: _quadratic(leading, -leading * (first + second), leading * first * second),
      discriminant: leading * leading * difference * difference,
      smallerRoot: min(first, second),
      largerRoot: max(first, second),
    );
  }

  EquationQuestion _formulaByGraph() {
    while (true) {
      final curveSet = _curveSet();
      final marks = _marksOn(curveSet.correct, curveSet)
          .where((mark) => !curveSet.distractors.any((curve) => _passesThrough(curve, mark)))
          .toList();
      if (marks.isEmpty) {
        continue;
      }
      final options = [curveSet.correct, ...curveSet.distractors]..shuffle(_random);
      return FormulaByGraphQuestion(
        graph: _graph(curveSet.correct, curveSet.viewport, _pick(marks)),
        formulas: options.map((curve) => curve.formula).toList(),
        correctIndex: options.indexOf(curveSet.correct),
      );
    }
  }

  EquationQuestion _graphByFormula() {
    while (true) {
      final curveSet = _curveSet();
      final curves = [curveSet.correct, ...curveSet.distractors]..shuffle(_random);
      final graphs = <FunctionGraph>[];
      for (final curve in curves) {
        final marks = _marksOn(curve, curveSet)
            .where((mark) => curve == curveSet.correct || !_passesThrough(curveSet.correct, mark))
            .toList();
        if (marks.isEmpty) {
          break;
        }
        graphs.add(_graph(curve, curveSet.viewport, _pick(marks)));
      }
      if (graphs.length == curves.length) {
        return GraphByFormulaQuestion(
          formula: curveSet.correct.formula,
          graphs: graphs,
          correctIndex: curves.indexOf(curveSet.correct),
        );
      }
    }
  }

  _CurveSet _curveSet() => switch (_pick(_CurveFamily.values)) {
        .line => _lineCurves(),
        .parabola => _parabolaCurves(),
        .hyperbola => _hyperbolaCurves(),
        .root => _rootCurves(),
        .absolute => _absoluteCurves(),
        .wave => _waveCurves(),
        .exponent => _exponentCurves(),
      };

  _CurveSet _lineCurves() {
    final slope = _pick(const [-3, -2, -1, 1, 2, 3]);
    final intercept = _pick(const [-4, -3, -2, -1, 1, 2, 3, 4]);
    final (swappedSlope, swappedIntercept) =
        intercept != slope ? (intercept, slope) : (slope + slope.sign, intercept);
    return _plainSet(_line(slope, intercept), [
      _line(-slope, intercept),
      _line(slope, -intercept),
      _line(swappedSlope, swappedIntercept),
    ]);
  }

  _CurveSet _parabolaCurves() {
    final direction = _sign();
    final shift = _pick(const [-3, -2, -1, 1, 2, 3]);
    final lift = _pick(const [-2, -1, 1, 2]);
    return _plainSet(_parabola(direction, shift, lift), [
      _parabola(direction, -shift, lift),
      _parabola(direction, shift, -lift),
      _parabola(-direction, shift, lift),
    ]);
  }

  _CurveSet _hyperbolaCurves() {
    const numerators = [2, 3, 4, 6];
    final sign = _sign();
    final numerator = _pick(numerators);
    final other = _pick(numerators.where((value) => value != numerator).toList());
    return _plainSet(_hyperbola(sign * numerator, 0), [
      _hyperbola(-sign * numerator, 0),
      _hyperbola(sign * other, 0),
      _hyperbola(sign * numerator, 1),
    ]);
  }

  _CurveSet _rootCurves() {
    final shift = _pick(const [-2, -1, 1, 2]);
    final lift = _pick(const [-2, -1, 1, 2]);
    return _plainSet(_root(1, shift, lift), [
      _root(1, -shift, lift),
      _root(1, shift, -lift),
      _root(-1, shift, lift),
    ]);
  }

  _CurveSet _absoluteCurves() {
    final shift = _pick(const [-2, -1, 1, 2]);
    final lift = _pick(const [-2, -1, 1, 2]);
    return _plainSet(_absolute(1, shift, lift), [
      _absolute(1, -shift, lift),
      _absolute(1, shift, -lift),
      _absolute(-1, shift, lift),
    ]);
  }

  _CurveSet _waveCurves() {
    final amplitude = _pick(const [1, 2, 3]) * _sign();
    final otherAmplitude = amplitude.abs() == 3 ? 2 * amplitude.sign : amplitude + amplitude.sign;
    final isSine = _random.nextBool();
    return _CurveSet(
      correct: _wave(isSine: isSine, amplitude: amplitude),
      distractors: [
        _wave(isSine: !isSine, amplitude: amplitude),
        _wave(isSine: isSine, amplitude: -amplitude),
        _wave(isSine: isSine, amplitude: otherAmplitude),
      ],
      viewport: waveViewport,
      candidates: _waveCandidates,
    );
  }

  _CurveSet _exponentCurves() {
    final base = _pick(const [2, 3]);
    final lift = _pick(const [-2, -1, 1, 2]);
    return _plainSet(_exponent(base, lift, direction: 1, isInverted: false), [
      _exponent(base, lift, direction: 1, isInverted: true),
      _exponent(base, -lift, direction: 1, isInverted: false),
      _exponent(base, lift, direction: -1, isInverted: false),
    ]);
  }

  _CurveSet _plainSet(_Curve correct, List<_Curve> distractors) => _CurveSet(
        correct: correct,
        distractors: distractors,
        viewport: plainViewport,
        candidates: _integerCandidates,
      );

  _Curve _line(int slope, int intercept) =>
      _Curve('y = ${_polynomial([(slope, 'x'), (intercept, '')])}', (x) => slope * x + intercept);

  _Curve _parabola(int direction, int shift, int lift) => _Curve(
        'y = ${_direction(direction)}(${_shifted(shift)})² ${_signed(lift)}',
        (x) => direction * (x - shift) * (x - shift) + lift,
      );

  _Curve _hyperbola(int numerator, int lift) => _Curve(
        'y = ${MathNotation.number(numerator)}/x${lift == 0 ? '' : ' ${_signed(lift)}'}',
        (x) => numerator / x + lift,
      );

  _Curve _root(int direction, int shift, int lift) => _Curve(
        'y = ${_direction(direction)}√(${_shifted(shift)}) ${_signed(lift)}',
        (x) => direction * sqrt(x - shift) + lift,
      );

  _Curve _absolute(int direction, int shift, int lift) => _Curve(
        'y = ${_direction(direction)}|${_shifted(shift)}| ${_signed(lift)}',
        (x) => direction * (x - shift).abs() + lift,
      );

  _Curve _wave({required bool isSine, required int amplitude}) => _Curve(
        'y = ${_coefficient(amplitude)}${isSine ? 'sin' : 'cos'} x',
        (x) => amplitude * (isSine ? sin(x) : cos(x)),
      );

  _Curve _exponent(int base, int lift, {required int direction, required bool isInverted}) => _Curve(
        'y = ${_direction(direction)}${isInverted ? '(1/$base)' : '$base'}ˣ ${_signed(lift)}',
        (x) => direction * pow(isInverted ? 1 / base : base, x).toDouble() + lift,
      );

  List<_Mark> _marksOn(_Curve curve, _CurveSet curveSet) => [
        for (final candidate in curveSet.candidates)
          if (_wholeValue(curve, candidate.x, curveSet.viewport) case final y?) _Mark(candidate, y),
      ];

  int? _wholeValue(_Curve curve, double x, GraphViewport viewport) {
    final y = curve.evaluate(x);
    if (!y.isFinite) {
      return null;
    }
    final rounded = y.round();
    final isWhole = (y - rounded).abs() < _tolerance;
    final isInside = rounded > viewport.minY && rounded < viewport.maxY;
    return isWhole && isInside && rounded != 0 ? rounded : null;
  }

  bool _passesThrough(_Curve curve, _Mark mark) {
    final y = curve.evaluate(mark.candidate.x);
    return y.isFinite && (y - mark.y).abs() < _tolerance;
  }

  FunctionGraph _graph(_Curve curve, GraphViewport viewport, _Mark mark) => FunctionGraph(
        viewport: viewport,
        segments: _sample(curve, viewport),
        markedPoint: Point(mark.candidate.x, mark.y.toDouble()),
        markedXLabel: mark.candidate.label,
        markedYLabel: MathNotation.number(mark.y),
      );

  List<List<Point<double>>> _sample(_Curve curve, GraphViewport viewport) {
    final span = viewport.maxX - viewport.minX;
    final heightLimit = (viewport.maxY - viewport.minY) * 2;
    final xs = {
      ...List.generate(_sampleCount + 1, (index) => viewport.minX + span * index / _sampleCount),
      for (var x = viewport.minX.ceil(); x <= viewport.maxX; x++) x.toDouble(),
    }.toList()
      ..sort();
    final segments = <List<Point<double>>>[];
    var current = <Point<double>>[];
    for (final x in xs) {
      final y = curve.evaluate(x);
      final isVisible = y.isFinite && y.abs() <= heightLimit;
      final previous = current.lastOrNull;
      final isJump = previous != null && isVisible && (previous.y - y).abs() > heightLimit / 2;
      if (!isVisible || isJump) {
        if (current.length > 1) {
          segments.add(current);
        }
        current = [];
      }
      if (isVisible) {
        current.add(Point(x, y));
      }
    }
    if (current.length > 1) {
      segments.add(current);
    }
    return segments;
  }

  String _quadratic(int leading, int middle, int constant) =>
      '${_polynomial([(leading, 'x²'), (middle, 'x'), (constant, '')])} = 0';

  String _polynomial(List<(int, String)> terms) {
    final parts = <String>[];
    for (final (coefficient, variable) in terms) {
      if (coefficient == 0) {
        continue;
      }
      final magnitude = coefficient.abs();
      final body = variable.isEmpty || magnitude != 1 ? '$magnitude$variable' : variable;
      parts.add(switch ((parts.isEmpty, coefficient < 0)) {
        (true, true) => '$_minus$body',
        (true, false) => body,
        (false, true) => '$_minus $body',
        (false, false) => '+ $body',
      });
    }
    return parts.isEmpty ? '0' : parts.join(' ');
  }

  String _shifted(int shift) => 'x ${_signed(-shift)}';

  String _signed(int value) => value < 0 ? '$_minus ${-value}' : '+ $value';

  String _direction(int direction) => direction < 0 ? _minus : '';

  String _coefficient(int value) => switch (value) {
        1 => '',
        -1 => _minus,
        _ => MathNotation.number(value),
      };

  int _sign() => _random.nextBool() ? 1 : -1;

  int _between(int lowest, int highest) => lowest + _random.nextInt(highest - lowest + 1);

  int _nonZeroBetween(int lowest, int highest) =>
      _pick([for (var value = lowest; value <= highest; value++) if (value != 0) value]);

  T _pick<T>(List<T> values) => values[_random.nextInt(values.length)];
}

enum _CurveFamily { line, parabola, hyperbola, root, absolute, wave, exponent }

class _Curve {
  final String formula;
  final double Function(double x) evaluate;

  const _Curve(this.formula, this.evaluate);
}

class _CurveSet {
  final _Curve correct;
  final List<_Curve> distractors;
  final GraphViewport viewport;
  final List<_MarkCandidate> candidates;

  const _CurveSet({
    required this.correct,
    required this.distractors,
    required this.viewport,
    required this.candidates,
  });
}

class _MarkCandidate {
  final double x;
  final String label;

  const _MarkCandidate(this.x, this.label);
}

class _Mark {
  final _MarkCandidate candidate;
  final int y;

  const _Mark(this.candidate, this.y);
}
