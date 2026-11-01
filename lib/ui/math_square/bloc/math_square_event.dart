sealed class MathSquareEvent {
  const MathSquareEvent();
}

final class MathSquareNextQuestionTappedEvent extends MathSquareEvent {
  const MathSquareNextQuestionTappedEvent();
}

final class MathSquareShowAnswerTappedEvent extends MathSquareEvent {
  const MathSquareShowAnswerTappedEvent();
}
