// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_strings.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppStringsEn extends AppStrings {
  AppStringsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Helpers VZ';

  @override
  String get homeTitle => 'Helpers VZ';

  @override
  String get homeSubtitle => 'The app skeleton is ready';

  @override
  String get homeMathSquareButton => 'Area of shapes';

  @override
  String get mathSquareTitle => 'Area of a shape';

  @override
  String get quizShowAnswer => 'Show answer';

  @override
  String get quizNextQuestion => 'Next question';

  @override
  String mathSquareAnswer(int answer) {
    return 'Answer: $answer';
  }

  @override
  String get squareQuestion => 'Find the area of the square';

  @override
  String get rectangleQuestion => 'Find the area of the rectangle';

  @override
  String get parallelogramQuestion => 'Find the area of the parallelogram';

  @override
  String get triangleQuestion => 'Find the area of the triangle';

  @override
  String get rightTriangleQuestion => 'Find the area of the right triangle';

  @override
  String get rhombusQuestion => 'Find the area of the rhombus';

  @override
  String get trapezoidQuestion => 'Find the area of the trapezoid';

  @override
  String sideMeasurement(int value) {
    return 'Side — $value';
  }

  @override
  String lengthMeasurement(int value) {
    return 'Length — $value';
  }

  @override
  String widthMeasurement(int value) {
    return 'Width — $value';
  }

  @override
  String baseMeasurement(int value) {
    return 'Base — $value';
  }

  @override
  String heightMeasurement(int value) {
    return 'Height — $value';
  }

  @override
  String legMeasurement(int value) {
    return 'Leg — $value';
  }

  @override
  String diagonalMeasurement(int value) {
    return 'Diagonal — $value';
  }

  @override
  String get homeMathEquationButton => 'Equations';

  @override
  String get mathEquationTitle => 'Equations';

  @override
  String get linearEquationQuestion => 'Solve the equation';

  @override
  String get discriminantQuestion => 'Find the discriminant';

  @override
  String get rootCountQuestion => 'How many roots does the equation have?';

  @override
  String get rootsQuestion => 'Find the roots of the equation';

  @override
  String get formulaByGraphQuestion => 'Which formula gives this graph?';

  @override
  String get graphByFormulaQuestion => 'Which graph belongs to this function?';

  @override
  String linearEquationAnswer(String root) {
    return 'Answer: x = $root';
  }

  @override
  String discriminantAnswer(String value) {
    return 'Answer: D = $value';
  }

  @override
  String discriminantHint(String value) {
    return 'D = $value';
  }

  @override
  String rootCountAnswer(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Answer: $count roots',
      one: 'Answer: 1 root',
      zero: 'Answer: no roots',
    );
    return '$_temp0';
  }

  @override
  String rootsAnswer(String first, String second) {
    return 'Answer: $first; $second';
  }

  @override
  String choiceAnswer(String choice) {
    return 'Answer: $choice';
  }

  @override
  String graphAnswer(int number) {
    return 'Answer: graph $number';
  }

  @override
  String get optionLetterA => 'A';

  @override
  String get optionLetterB => 'B';

  @override
  String get optionLetterC => 'C';

  @override
  String get optionLetterD => 'D';

  @override
  String get graphAxisX => 'x';

  @override
  String get graphAxisY => 'y';
}
