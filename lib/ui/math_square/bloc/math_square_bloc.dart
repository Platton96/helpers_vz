import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers_vz/repositories/math_square_repository.dart';
import 'package:helpers_vz/services/crash_reporting_service.dart';
import 'package:helpers_vz/ui/base_bloc.dart';
import 'package:helpers_vz/ui/math_square/bloc/math_square_event.dart';
import 'package:helpers_vz/ui/math_square/bloc/math_square_state.dart';

class MathSquareBloc extends BaseBloc<MathSquareEvent, MathSquareState> {
  final MathSquareRepository _repository;

  MathSquareBloc(this._repository, CrashReportingService crashReportingService)
      : super(crashReportingService, MathSquareState(question: _repository.nextQuestion())) {
    on<MathSquareEvent>(
      (event, emit) => switch (event) {
        MathSquareNextQuestionTappedEvent() => _handleNextQuestionTappedEvent(emit, event),
        MathSquareShowAnswerTappedEvent() => _handleShowAnswerTappedEvent(emit, event),
      },
    );
  }

  void _handleNextQuestionTappedEvent(Emitter<MathSquareState> emit, MathSquareNextQuestionTappedEvent event) =>
      emit(MathSquareState(question: _repository.nextQuestion()));

  void _handleShowAnswerTappedEvent(Emitter<MathSquareState> emit, MathSquareShowAnswerTappedEvent event) =>
      emit(state.copyWith(isAnswerRevealed: true));
}
