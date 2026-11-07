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
  String get quizShowAnswer => 'Показать ответ';

  @override
  String get quizNextQuestion => 'Следующий вопрос';

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

  @override
  String get homeMathEquationButton => 'Уравнения';

  @override
  String get mathEquationTitle => 'Уравнения';

  @override
  String get linearEquationQuestion => 'Решите уравнение';

  @override
  String get discriminantQuestion => 'Найдите дискриминант';

  @override
  String get rootCountQuestion => 'Сколько корней у уравнения?';

  @override
  String get rootsQuestion => 'Найдите корни уравнения';

  @override
  String get formulaByGraphQuestion => 'Какая формула задаёт этот график?';

  @override
  String get graphByFormulaQuestion => 'Какой график у этой функции?';

  @override
  String linearEquationAnswer(String root) {
    return 'Ответ: x = $root';
  }

  @override
  String discriminantAnswer(String value) {
    return 'Ответ: D = $value';
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
      other: 'Ответ: $count корней',
      few: 'Ответ: $count корня',
      one: 'Ответ: 1 корень',
      zero: 'Ответ: корней нет',
    );
    return '$_temp0';
  }

  @override
  String rootsAnswer(String first, String second) {
    return 'Ответ: $first; $second';
  }

  @override
  String choiceAnswer(String choice) {
    return 'Ответ: $choice';
  }

  @override
  String graphAnswer(int number) {
    return 'Ответ: график $number';
  }

  @override
  String get optionLetterA => 'А';

  @override
  String get optionLetterB => 'Б';

  @override
  String get optionLetterC => 'В';

  @override
  String get optionLetterD => 'Г';

  @override
  String get graphAxisX => 'x';

  @override
  String get graphAxisY => 'y';
}
