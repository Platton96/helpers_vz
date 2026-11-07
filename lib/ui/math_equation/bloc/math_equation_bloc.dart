import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers_vz/repositories/math_equation_repository.dart';
import 'package:helpers_vz/services/crash_reporting_service.dart';
import 'package:helpers_vz/ui/base_bloc.dart';
import 'package:helpers_vz/ui/math_equation/bloc/math_equation_event.dart';
import 'package:helpers_vz/ui/math_equation/bloc/math_equation_state.dart';

class MathEquationBloc extends BaseBloc<MathEquationEvent, MathEquationState> {
  final MathEquationRepository _repository;

  MathEquationBloc(this._repository, CrashReportingService crashReportingService)
      : super(crashReportingService, MathEquationState(question: _repository.nextQuestion())) {
    on<MathEquationEvent>(
      (event, emit) => switch (event) {
        MathEquationNextQuestionTappedEvent() => _handleNextQuestionTappedEvent(emit, event),
        MathEquationShowAnswerTappedEvent() => _handleShowAnswerTappedEvent(emit, event),
      },
    );
  }

  void _handleNextQuestionTappedEvent(Emitter<MathEquationState> emit, MathEquationNextQuestionTappedEvent event) =>
      emit(MathEquationState(question: _repository.nextQuestion()));

  void _handleShowAnswerTappedEvent(Emitter<MathEquationState> emit, MathEquationShowAnswerTappedEvent event) =>
      emit(state.copyWith(isAnswerRevealed: true));
}
