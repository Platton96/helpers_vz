// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_strings.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppStringsRu extends AppStrings {
  AppStringsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Helpers VZ';

  @override
  String get homeTitle => 'Helpers VZ';

  @override
  String get homeSubtitle => 'Каркас приложения готов';

  @override
  String get homeMathSquareButton => 'Площадь фигур';

  @override
  String get mathSquareTitle => 'Площадь фигуры';

  @override
  String get mathSquareShowAnswer => 'Показать ответ';

  @override
  String get mathSquareNextQuestion => 'Следующий вопрос';

  @override
  String mathSquareAnswer(int answer) {
    return 'Ответ: $answer';
  }

  @override
  String get squareQuestion => 'Найдите площадь квадрата';

  @override
  String get rectangleQuestion => 'Найдите площадь прямоугольника';

  @override
  String get parallelogramQuestion => 'Найдите площадь параллелограмма';

  @override
  String get triangleQuestion => 'Найдите площадь треугольника';

  @override
  String get rightTriangleQuestion =>
      'Найдите площадь прямоугольного треугольника';

  @override
  String get rhombusQuestion => 'Найдите площадь ромба';

  @override
  String get trapezoidQuestion => 'Найдите площадь трапеции';

  @override
  String sideMeasurement(int value) {
    return 'Сторона — $value';
  }

  @override
  String lengthMeasurement(int value) {
    return 'Длина — $value';
  }

  @override
  String widthMeasurement(int value) {
    return 'Ширина — $value';
  }

  @override
  String baseMeasurement(int value) {
    return 'Основание — $value';
  }

  @override
  String heightMeasurement(int value) {
    return 'Высота — $value';
  }

  @override
  String legMeasurement(int value) {
    return 'Катет — $value';
  }

  @override
  String diagonalMeasurement(int value) {
    return 'Диагональ — $value';
  }
}
