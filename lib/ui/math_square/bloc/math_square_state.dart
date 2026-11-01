import 'package:equatable/equatable.dart';
import 'package:helpers_vz/models/area_question.dart';

class MathSquareState extends Equatable {
  final AreaQuestion question;
  final bool isAnswerRevealed;

  const MathSquareState({required this.question, this.isAnswerRevealed = false});

  @override
  List<Object?> get props => [question, isAnswerRevealed];

  MathSquareState copyWith({AreaQuestion? question, bool? isAnswerRevealed}) => MathSquareState(
        question: question ?? this.question,
        isAnswerRevealed: isAnswerRevealed ?? this.isAnswerRevealed,
      );
}
