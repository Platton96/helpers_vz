import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_vz/di/di.dart';
import 'package:helpers_vz/models/equation_kind.dart';
import 'package:helpers_vz/models/equation_question.dart';
import 'package:helpers_vz/repositories/math_equation_repository.dart';
import 'package:helpers_vz/ui/math_equation/math_equation_screen.dart';
import 'package:helpers_vz/ui/math_equation/widgets/function_graph_view.dart';

import '../../helpers/test_app.dart';

void main() {
  setUpTestApp();

  void useKind(EquationKind kind) => getIt
    ..unregister<MathEquationRepository>()
    ..registerLazySingleton<MathEquationRepository>(() => _SingleKindRepository(kind));

  for (final size in [phoneSize, tabletSize, desktopSize]) {
    for (final kind in EquationKind.values) {
      testWidgets('shows and reveals a ${kind.name} question at $size', (tester) async {
        useKind(kind);
        final question = _SingleKindRepository(kind).nextQuestion();
        await pumpTestApp(tester, const MathEquationScreen(), size: size);

        final (title, prompt, graphCount, answer) = switch (question) {
          LinearEquationQuestion(:final equation) =>
            (russianStrings.linearEquationQuestion, equation, 0, russianStrings.linearEquationAnswer('')),
          DiscriminantQuestion(:final equation) =>
            (russianStrings.discriminantQuestion, equation, 0, russianStrings.discriminantAnswer('')),
          RootCountQuestion(:final equation, :final rootCount) =>
            (russianStrings.rootCountQuestion, equation, 0, russianStrings.rootCountAnswer(rootCount)),
          RootsQuestion(:final equation) => (russianStrings.rootsQuestion, equation, 0, russianStrings.rootsAnswer('', '')),
          FormulaByGraphQuestion(:final formulas) =>
            (russianStrings.formulaByGraphQuestion, formulas.firstOrNull ?? '', 1, russianStrings.choiceAnswer('')),
          GraphByFormulaQuestion(:final formula) =>
            (russianStrings.graphByFormulaQuestion, formula, 4, russianStrings.graphAnswer(0)),
        };
        final answerPrefix = answer.substring(0, 5);

        expect(find.text(title), findsOneWidget);
        expect(find.text(prompt), findsOneWidget);
        expect(find.byType(FunctionGraphView), findsNWidgets(graphCount));
        expect(find.textContaining(answerPrefix), findsNothing);

        await tester.tap(find.text(russianStrings.quizShowAnswer));
        await tester.pumpAndSettle();
        expect(find.textContaining(answerPrefix), findsOneWidget);
      });
    }
  }

  testWidgets('next question hides the answer', (tester) async {
    useKind(.linear);
    await pumpTestApp(tester, const MathEquationScreen(), size: phoneSize);

    await tester.tap(find.text(russianStrings.quizShowAnswer));
    await tester.pumpAndSettle();
    await tester.tap(find.text(russianStrings.quizNextQuestion));
    await tester.pumpAndSettle();

    expect(find.textContaining(russianStrings.linearEquationAnswer('').substring(0, 5)), findsNothing);
  });

  testWidgets('shows the English question for the English locale', (tester) async {
    useKind(.discriminant);
    await pumpTestApp(tester, const MathEquationScreen(), size: phoneSize, locale: const Locale('en'));

    expect(find.text(englishStrings.discriminantQuestion), findsOneWidget);
  });
}

class _SingleKindRepository extends MathEquationRepository {
  final EquationKind kind;

  _SingleKindRepository(this.kind) : super(Random(5));

  @override
  EquationQuestion nextQuestion() => questionOf(kind);
}
