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
  String get mathSquareShowAnswer => 'Show answer';

  @override
  String get mathSquareNextQuestion => 'Next question';

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
}
