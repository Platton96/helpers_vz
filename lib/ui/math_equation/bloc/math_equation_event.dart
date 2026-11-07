sealed class MathEquationEvent {
  const MathEquationEvent();
}

final class MathEquationNextQuestionTappedEvent extends MathEquationEvent {
  const MathEquationNextQuestionTappedEvent();
}

final class MathEquationShowAnswerTappedEvent extends MathEquationEvent {
  const MathEquationShowAnswerTappedEvent();
}
