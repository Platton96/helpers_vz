import 'package:flutter/material.dart';
import 'package:helpers_vz/ui_kit/app_text_styles.dart';

class EquationPromptView extends StatelessWidget {
  final String title;
  final String equation;
  final String? hint;
  final String answer;
  final bool isAnswerRevealed;

  const EquationPromptView({
    super.key,
    required this.title,
    required this.equation,
    this.hint,
    required this.answer,
    required this.isAnswerRevealed,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: .min,
          spacing: 24,
          children: [
            Text(title, style: AppTextStyles.question, textAlign: .center),
            FittedBox(fit: .scaleDown, child: Text(equation, style: AppTextStyles.equation)),
            if (hint case final hint?) Text(hint, style: AppTextStyles.measurement, textAlign: .center),
            if (isAnswerRevealed) Text(answer, style: AppTextStyles.answer, textAlign: .center),
          ],
        ),
      );
}
