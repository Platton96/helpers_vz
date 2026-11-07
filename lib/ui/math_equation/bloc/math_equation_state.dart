import 'package:equatable/equatable.dart';
import 'package:helpers_vz/models/equation_question.dart';

class MathEquationState extends Equatable {
  final EquationQuestion question;
  final bool isAnswerRevealed;

  const MathEquationState({required this.question, this.isAnswerRevealed = false});

  @override
  List<Object?> get props => [question, isAnswerRevealed];

  MathEquationState copyWith({EquationQuestion? question, bool? isAnswerRevealed}) => MathEquationState(
        question: question ?? this.question,
        isAnswerRevealed: isAnswerRevealed ?? this.isAnswerRevealed,
      );
}
