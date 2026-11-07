import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers_vz/di/di.dart';
import 'package:helpers_vz/localizations/generated/app_strings.dart';
import 'package:helpers_vz/managers/math_notation.dart';
import 'package:helpers_vz/models/equation_question.dart';
import 'package:helpers_vz/ui/math_equation/bloc/math_equation_bloc.dart';
import 'package:helpers_vz/ui/math_equation/bloc/math_equation_event.dart';
import 'package:helpers_vz/ui/math_equation/bloc/math_equation_state.dart';
import 'package:helpers_vz/ui/math_equation/widgets/equation_prompt_view.dart';
import 'package:helpers_vz/ui/math_equation/widgets/formula_choice_view.dart';
import 'package:helpers_vz/ui/math_equation/widgets/graph_choice_view.dart';
import 'package:helpers_vz/ui_kit/app_text_styles.dart';
import 'package:helpers_vz/ui_kit/quiz_actions.dart';
import 'package:helpers_vz/ui_kit/quiz_card.dart';

class MathEquationScreen extends StatelessWidget {
  const MathEquationScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<MathEquationBloc>(),
        child: const _MathEquationView(),
      );
}

class _MathEquationView extends StatelessWidget {
  static const double _maxContentWidth = 1040;

  const _MathEquationView();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppStrings.of(context).mathEquationTitle, style: AppTextStyles.title)),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: _maxContentWidth),
              child: Padding(
                padding: const .all(16),
                child: BlocBuilder<MathEquationBloc, MathEquationState>(
                  builder: (context, state) => Column(
                    crossAxisAlignment: .stretch,
                    spacing: 16,
                    children: [
                      Expanded(
                        child: QuizCard(
                          child: _QuestionBody(question: state.question, isAnswerRevealed: state.isAnswerRevealed),
                        ),
                      ),
                      QuizActions(
                        isAnswerRevealed: state.isAnswerRevealed,
                        onShowAnswer: () =>
                            context.read<MathEquationBloc>().add(const MathEquationShowAnswerTappedEvent()),
                        onNextQuestion: () =>
                            context.read<MathEquationBloc>().add(const MathEquationNextQuestionTappedEvent()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _QuestionBody extends StatelessWidget {
  final EquationQuestion question;
  final bool isAnswerRevealed;

  const _QuestionBody({required this.question, required this.isAnswerRevealed});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return switch (question) {
      LinearEquationQuestion(:final equation, :final root) => EquationPromptView(
          title: strings.linearEquationQuestion,
          equation: equation,
          answer: strings.linearEquationAnswer(MathNotation.number(root)),
          isAnswerRevealed: isAnswerRevealed,
        ),
      DiscriminantQuestion(:final equation, :final discriminant) => EquationPromptView(
          title: strings.discriminantQuestion,
          equation: equation,
          answer: strings.discriminantAnswer(MathNotation.number(discriminant)),
          isAnswerRevealed: isAnswerRevealed,
        ),
      RootCountQuestion(:final equation, :final rootCount) => EquationPromptView(
          title: strings.rootCountQuestion,
          equation: equation,
          answer: strings.rootCountAnswer(rootCount),
          isAnswerRevealed: isAnswerRevealed,
        ),
      RootsQuestion(:final equation, :final discriminant, :final smallerRoot, :final largerRoot) =>
        EquationPromptView(
          title: strings.rootsQuestion,
          equation: equation,
          hint: strings.discriminantHint(MathNotation.number(discriminant)),
          answer: strings.rootsAnswer(MathNotation.number(smallerRoot), MathNotation.number(largerRoot)),
          isAnswerRevealed: isAnswerRevealed,
        ),
      FormulaByGraphQuestion(:final graph, :final formulas, :final correctIndex) => FormulaChoiceView(
          graph: graph,
          formulas: formulas,
          correctIndex: correctIndex,
          isAnswerRevealed: isAnswerRevealed,
        ),
      GraphByFormulaQuestion(:final formula, :final graphs, :final correctIndex) => GraphChoiceView(
          formula: formula,
          graphs: graphs,
          correctIndex: correctIndex,
          isAnswerRevealed: isAnswerRevealed,
        ),
    };
  }
}
