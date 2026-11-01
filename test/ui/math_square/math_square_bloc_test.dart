import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_vz/repositories/math_square_repository.dart';
import 'package:helpers_vz/services/crash_reporting_service.dart';
import 'package:helpers_vz/ui/math_square/bloc/math_square_bloc.dart';
import 'package:helpers_vz/ui/math_square/bloc/math_square_event.dart';

void main() {
  MathSquareBloc createBloc() => MathSquareBloc(MathSquareRepository(Random(1)), const CrashReportingService());

  test('starts with the first generated question and a hidden answer', () {
    final bloc = createBloc();
    final expected = MathSquareRepository(Random(1)).nextQuestion();

    expect(bloc.state.question, expected);
    expect(bloc.state.isAnswerRevealed, isFalse);
    bloc.close();
  });

  test('show answer reveals the answer', () async {
    final bloc = createBloc()..add(const MathSquareShowAnswerTappedEvent());
    await pumpEventQueue();

    expect(bloc.state.isAnswerRevealed, isTrue);
    await bloc.close();
  });

  test('next question takes the next generated question and hides the answer', () async {
    final repository = MathSquareRepository(Random(1));
    final first = repository.nextQuestion();
    final second = repository.nextQuestion();
    final bloc = createBloc()
      ..add(const MathSquareShowAnswerTappedEvent())
      ..add(const MathSquareNextQuestionTappedEvent());
    await pumpEventQueue();

    expect(bloc.state.question, isNot(first));
    expect(bloc.state.question, second);
    expect(bloc.state.isAnswerRevealed, isFalse);
    await bloc.close();
  });
}
