import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpers_vz/di/di.dart';
import 'package:helpers_vz/localizations/generated/app_strings.dart';
import 'package:helpers_vz/localizations/localized_enums.dart';
import 'package:helpers_vz/models/area_question.dart';
import 'package:helpers_vz/ui/math_square/bloc/math_square_bloc.dart';
import 'package:helpers_vz/ui/math_square/bloc/math_square_event.dart';
import 'package:helpers_vz/ui/math_square/bloc/math_square_state.dart';
import 'package:helpers_vz/ui/math_square/widgets/area_figure_view.dart';
import 'package:helpers_vz/ui_kit/app_breakpoints.dart';
import 'package:helpers_vz/ui_kit/app_text_styles.dart';
import 'package:helpers_vz/ui_kit/quiz_actions.dart';
import 'package:helpers_vz/ui_kit/quiz_card.dart';

class MathSquareScreen extends StatelessWidget {
  const MathSquareScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<MathSquareBloc>(),
        child: const _MathSquareView(),
      );
}

class _MathSquareView extends StatelessWidget {
  static const double _maxContentWidth = 1040;

  const _MathSquareView();

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(strings.mathSquareTitle, style: AppTextStyles.title)),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxContentWidth),
            child: Padding(
              padding: const .all(16),
              child: BlocBuilder<MathSquareBloc, MathSquareState>(
                builder: (context, state) => Column(
                  crossAxisAlignment: .stretch,
                  spacing: 16,
                  children: [
                    Expanded(
                      child: _QuestionCard(question: state.question, isAnswerRevealed: state.isAnswerRevealed),
                    ),
                    QuizActions(
                      isAnswerRevealed: state.isAnswerRevealed,
                      onShowAnswer: () => context.read<MathSquareBloc>().add(const MathSquareShowAnswerTappedEvent()),
                      onNextQuestion: () =>
                          context.read<MathSquareBloc>().add(const MathSquareNextQuestionTappedEvent()),
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
}

class _QuestionCard extends StatelessWidget {
  final AreaQuestion question;
  final bool isAnswerRevealed;

  const _QuestionCard({required this.question, required this.isAnswerRevealed});

  @override
  Widget build(BuildContext context) {
    final figure = AreaFigureView(outline: question.outline, measurements: question.measurements);
    final text = _QuestionText(question: question, isAnswerRevealed: isAnswerRevealed);

    return QuizCard(
      child: LayoutBuilder(
        builder: (context, constraints) => AppBreakpoints.isWide(constraints.maxWidth)
            ? Row(
                spacing: 24,
                children: [
                  Expanded(child: figure),
                  Expanded(child: text),
                ],
              )
            : Column(
                crossAxisAlignment: .stretch,
                spacing: 16,
                children: [
                  Expanded(child: figure),
                  text,
                ],
              ),
      ),
    );
  }
}

class _QuestionText extends StatelessWidget {
  final AreaQuestion question;
  final bool isAnswerRevealed;

  const _QuestionText({required this.question, required this.isAnswerRevealed});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return Column(
      mainAxisSize: .min,
      mainAxisAlignment: .center,
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(strings.areaQuestion(question.figure), style: AppTextStyles.question),
        for (final measurement in question.measurements)
          Text(strings.measurement(measurement.dimension, measurement.value), style: AppTextStyles.measurement),
        if (isAnswerRevealed) Text(strings.mathSquareAnswer(question.answer), style: AppTextStyles.answer),
      ],
    );
  }
}
