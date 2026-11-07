import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_vz/repositories/math_equation_repository.dart';
import 'package:helpers_vz/services/crash_reporting_service.dart';
import 'package:helpers_vz/ui/math_equation/bloc/math_equation_bloc.dart';
import 'package:helpers_vz/ui/math_equation/bloc/math_equation_event.dart';

void main() {
  MathEquationBloc createBloc() =>
      MathEquationBloc(MathEquationRepository(Random(1)), const CrashReportingService());

  test('starts with the first generated question and a hidden answer', () {
    final bloc = createBloc();

    expect(bloc.state.question, MathEquationRepository(Random(1)).nextQuestion());
    expect(bloc.state.isAnswerRevealed, isFalse);
    bloc.close();
  });

  test('show answer reveals the answer', () async {
    final bloc = createBloc()..add(const MathEquationShowAnswerTappedEvent());
    await pumpEventQueue();

    expect(bloc.state.isAnswerRevealed, isTrue);
    await bloc.close();
  });

  test('next question takes the next generated question and hides the answer', () async {
    final repository = MathEquationRepository(Random(1))..nextQuestion();
    final second = repository.nextQuestion();
    final bloc = createBloc()
      ..add(const MathEquationShowAnswerTappedEvent())
      ..add(const MathEquationNextQuestionTappedEvent());
    await pumpEventQueue();

    expect(bloc.state.question, second);
    expect(bloc.state.isAnswerRevealed, isFalse);
    await bloc.close();
  });
}
