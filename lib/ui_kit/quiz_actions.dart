import 'package:flutter/material.dart';
import 'package:helpers_vz/localizations/generated/app_strings.dart';

class QuizActions extends StatelessWidget {
  final bool isAnswerRevealed;
  final VoidCallback onShowAnswer;
  final VoidCallback onNextQuestion;

  const QuizActions({
    super.key,
    required this.isAnswerRevealed,
    required this.onShowAnswer,
    required this.onNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: isAnswerRevealed ? null : onShowAnswer,
            child: Text(strings.quizShowAnswer, textAlign: .center),
          ),
        ),
        Expanded(
          child: FilledButton(
            onPressed: onNextQuestion,
            child: Text(strings.quizNextQuestion, textAlign: .center),
          ),
        ),
      ],
    );
  }
}
