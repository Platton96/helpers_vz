import 'package:flutter/material.dart';
import 'package:helpers_vz/localizations/generated/app_strings.dart';
import 'package:helpers_vz/localizations/localized_enums.dart';
import 'package:helpers_vz/models/function_graph.dart';
import 'package:helpers_vz/ui/math_equation/widgets/choice_frame.dart';
import 'package:helpers_vz/ui/math_equation/widgets/function_graph_view.dart';
import 'package:helpers_vz/ui_kit/app_breakpoints.dart';
import 'package:helpers_vz/ui_kit/app_text_styles.dart';

class FormulaChoiceView extends StatelessWidget {
  final FunctionGraph graph;
  final List<String> formulas;
  final int correctIndex;
  final bool isAnswerRevealed;

  const FormulaChoiceView({
    super.key,
    required this.graph,
    required this.formulas,
    required this.correctIndex,
    required this.isAnswerRevealed,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);
    final graphView = FunctionGraphView(
      graph: graph,
      horizontalAxisLabel: strings.graphAxisX,
      verticalAxisLabel: strings.graphAxisY,
    );
    final details = _FormulaOptions(formulas: formulas, correctIndex: correctIndex, isAnswerRevealed: isAnswerRevealed);

    return LayoutBuilder(
      builder: (context, constraints) => AppBreakpoints.isWide(constraints.maxWidth)
          ? Row(
              spacing: 24,
              children: [
                Expanded(child: graphView),
                Expanded(child: Center(child: details)),
              ],
            )
          : Column(
              crossAxisAlignment: .stretch,
              spacing: 16,
              children: [
                Expanded(child: graphView),
                details,
              ],
            ),
    );
  }
}

class _FormulaOptions extends StatelessWidget {
  final List<String> formulas;
  final int correctIndex;
  final bool isAnswerRevealed;

  const _FormulaOptions({required this.formulas, required this.correctIndex, required this.isAnswerRevealed});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      spacing: 10,
      children: [
        Text(strings.formulaByGraphQuestion, style: AppTextStyles.question),
        for (final (index, formula) in formulas.indexed)
          ChoiceFrame(
            isHighlighted: isAnswerRevealed && index == correctIndex,
            child: Padding(
              padding: const .symmetric(horizontal: 14, vertical: 8),
              child: Row(
                spacing: 12,
                children: [
                  Text(strings.optionLetter(index), style: AppTextStyles.optionLetter),
                  Expanded(child: Text(formula, style: AppTextStyles.formulaOption)),
                ],
              ),
            ),
          ),
        if (isAnswerRevealed)
          Text(strings.choiceAnswer(strings.optionLetter(correctIndex)), style: AppTextStyles.answer),
      ],
    );
  }
}
