import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_vz/di/di.dart';
import 'package:helpers_vz/localizations/localized_enums.dart';
import 'package:helpers_vz/repositories/math_square_repository.dart';
import 'package:helpers_vz/ui/math_square/math_square_screen.dart';
import 'package:helpers_vz/ui/math_square/widgets/area_figure_view.dart';

import '../../helpers/test_app.dart';

void main() {
  setUpTestApp();

  setUp(() {
    getIt
      ..unregister<MathSquareRepository>()
      ..registerLazySingleton(() => MathSquareRepository(Random(5)));
  });

  for (final size in [phoneSize, tabletSize, desktopSize]) {
    testWidgets('shows the figure, the question and its measurements at $size', (tester) async {
      final question = MathSquareRepository(Random(5)).nextQuestion();
      await pumpTestApp(tester, const MathSquareScreen(), size: size);

      expect(find.byType(AreaFigureView), findsOneWidget);
      expect(find.text(russianStrings.areaQuestion(question.figure)), findsOneWidget);
      for (final measurement in question.measurements) {
        expect(find.text(russianStrings.measurement(measurement.dimension, measurement.value)), findsWidgets);
      }
      expect(find.text(russianStrings.mathSquareAnswer(question.answer)), findsNothing);
    });

    testWidgets('reveals the answer and moves to the next question at $size', (tester) async {
      final repository = MathSquareRepository(Random(5));
      final first = repository.nextQuestion();
      final second = repository.nextQuestion();
      await pumpTestApp(tester, const MathSquareScreen(), size: size);

      await tester.tap(find.text(russianStrings.mathSquareShowAnswer));
      await tester.pumpAndSettle();
      expect(find.text(russianStrings.mathSquareAnswer(first.answer)), findsOneWidget);

      await tester.tap(find.text(russianStrings.mathSquareNextQuestion));
      await tester.pumpAndSettle();
      expect(find.text(russianStrings.mathSquareAnswer(first.answer)), findsNothing);
      expect(find.text(russianStrings.areaQuestion(second.figure)), findsOneWidget);
    });
  }

  testWidgets('shows the English question for the English locale', (tester) async {
    final question = MathSquareRepository(Random(5)).nextQuestion();
    await pumpTestApp(tester, const MathSquareScreen(), size: phoneSize, locale: const Locale('en'));

    expect(find.text(englishStrings.areaQuestion(question.figure)), findsOneWidget);
  });
}
