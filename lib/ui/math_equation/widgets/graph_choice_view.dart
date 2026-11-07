import 'package:flutter/material.dart';
import 'package:helpers_vz/localizations/generated/app_strings.dart';
import 'package:helpers_vz/models/function_graph.dart';
import 'package:helpers_vz/ui/math_equation/widgets/choice_frame.dart';
import 'package:helpers_vz/ui/math_equation/widgets/function_graph_view.dart';
import 'package:helpers_vz/ui_kit/app_text_styles.dart';

class GraphChoiceView extends StatelessWidget {
  static const int _columnCount = 2;

  final String formula;
  final List<FunctionGraph> graphs;
  final int correctIndex;
  final bool isAnswerRevealed;

  const GraphChoiceView({
    super.key,
    required this.formula,
    required this.graphs,
    required this.correctIndex,
    required this.isAnswerRevealed,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return Column(
      crossAxisAlignment: .stretch,
      spacing: 12,
      children: [
        Text(strings.graphByFormulaQuestion, style: AppTextStyles.question, textAlign: .center),
        FittedBox(fit: .scaleDown, child: Text(formula, style: AppTextStyles.equation)),
        Expanded(
          child: Column(
            spacing: 12,
            children: [
              for (var start = 0; start < graphs.length; start += _columnCount)
                Expanded(
                  child: Row(
                    spacing: 12,
                    children: [
                      for (final (index, graph) in graphs.indexed.skip(start).take(_columnCount))
                        Expanded(
                          child: _GraphTile(
                            number: index + 1,
                            graph: graph,
                            isHighlighted: isAnswerRevealed && index == correctIndex,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (isAnswerRevealed)
          Text(strings.graphAnswer(correctIndex + 1), style: AppTextStyles.answer, textAlign: .center),
      ],
    );
  }
}

class _GraphTile extends StatelessWidget {
  final int number;
  final FunctionGraph graph;
  final bool isHighlighted;

  const _GraphTile({required this.number, required this.graph, required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return ChoiceFrame(
      isHighlighted: isHighlighted,
      child: Stack(
        children: [
          Positioned.fill(
            child: FunctionGraphView(
              graph: graph,
              horizontalAxisLabel: strings.graphAxisX,
              verticalAxisLabel: strings.graphAxisY,
            ),
          ),
          Positioned(top: 8, left: 10, child: Text('$number', style: AppTextStyles.graphNumber)),
        ],
      ),
    );
  }
}
