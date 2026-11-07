import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:helpers_vz/models/function_graph.dart';

part 'equation_question.freezed.dart';

@freezed
sealed class EquationQuestion with _$EquationQuestion {
  const factory EquationQuestion.linear({required String equation, required int root}) = LinearEquationQuestion;

  const factory EquationQuestion.discriminant({required String equation, required int discriminant}) =
      DiscriminantQuestion;

  const factory EquationQuestion.rootCount({required String equation, required int rootCount}) = RootCountQuestion;

  const factory EquationQuestion.roots({
    required String equation,
    required int discriminant,
    required int smallerRoot,
    required int largerRoot,
  }) = RootsQuestion;

  const factory EquationQuestion.formulaByGraph({
    required FunctionGraph graph,
    required List<String> formulas,
    required int correctIndex,
  }) = FormulaByGraphQuestion;

  const factory EquationQuestion.graphByFormula({
    required String formula,
    required List<FunctionGraph> graphs,
    required int correctIndex,
  }) = GraphByFormulaQuestion;
}
