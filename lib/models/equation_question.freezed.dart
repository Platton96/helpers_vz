// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equation_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EquationQuestion {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquationQuestion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EquationQuestion()';
}


}

/// @nodoc
class $EquationQuestionCopyWith<$Res>  {
$EquationQuestionCopyWith(EquationQuestion _, $Res Function(EquationQuestion) __);
}


/// Adds pattern-matching-related methods to [EquationQuestion].
extension EquationQuestionPatterns on EquationQuestion {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LinearEquationQuestion value)?  linear,TResult Function( DiscriminantQuestion value)?  discriminant,TResult Function( RootCountQuestion value)?  rootCount,TResult Function( RootsQuestion value)?  roots,TResult Function( FormulaByGraphQuestion value)?  formulaByGraph,TResult Function( GraphByFormulaQuestion value)?  graphByFormula,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LinearEquationQuestion() when linear != null:
return linear(_that);case DiscriminantQuestion() when discriminant != null:
return discriminant(_that);case RootCountQuestion() when rootCount != null:
return rootCount(_that);case RootsQuestion() when roots != null:
return roots(_that);case FormulaByGraphQuestion() when formulaByGraph != null:
return formulaByGraph(_that);case GraphByFormulaQuestion() when graphByFormula != null:
return graphByFormula(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LinearEquationQuestion value)  linear,required TResult Function( DiscriminantQuestion value)  discriminant,required TResult Function( RootCountQuestion value)  rootCount,required TResult Function( RootsQuestion value)  roots,required TResult Function( FormulaByGraphQuestion value)  formulaByGraph,required TResult Function( GraphByFormulaQuestion value)  graphByFormula,}){
final _that = this;
switch (_that) {
case LinearEquationQuestion():
return linear(_that);case DiscriminantQuestion():
return discriminant(_that);case RootCountQuestion():
return rootCount(_that);case RootsQuestion():
return roots(_that);case FormulaByGraphQuestion():
return formulaByGraph(_that);case GraphByFormulaQuestion():
return graphByFormula(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LinearEquationQuestion value)?  linear,TResult? Function( DiscriminantQuestion value)?  discriminant,TResult? Function( RootCountQuestion value)?  rootCount,TResult? Function( RootsQuestion value)?  roots,TResult? Function( FormulaByGraphQuestion value)?  formulaByGraph,TResult? Function( GraphByFormulaQuestion value)?  graphByFormula,}){
final _that = this;
switch (_that) {
case LinearEquationQuestion() when linear != null:
return linear(_that);case DiscriminantQuestion() when discriminant != null:
return discriminant(_that);case RootCountQuestion() when rootCount != null:
return rootCount(_that);case RootsQuestion() when roots != null:
return roots(_that);case FormulaByGraphQuestion() when formulaByGraph != null:
return formulaByGraph(_that);case GraphByFormulaQuestion() when graphByFormula != null:
return graphByFormula(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String equation,  int root)?  linear,TResult Function( String equation,  int discriminant)?  discriminant,TResult Function( String equation,  int rootCount)?  rootCount,TResult Function( String equation,  int discriminant,  int smallerRoot,  int largerRoot)?  roots,TResult Function( FunctionGraph graph,  List<String> formulas,  int correctIndex)?  formulaByGraph,TResult Function( String formula,  List<FunctionGraph> graphs,  int correctIndex)?  graphByFormula,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LinearEquationQuestion() when linear != null:
return linear(_that.equation,_that.root);case DiscriminantQuestion() when discriminant != null:
return discriminant(_that.equation,_that.discriminant);case RootCountQuestion() when rootCount != null:
return rootCount(_that.equation,_that.rootCount);case RootsQuestion() when roots != null:
return roots(_that.equation,_that.discriminant,_that.smallerRoot,_that.largerRoot);case FormulaByGraphQuestion() when formulaByGraph != null:
return formulaByGraph(_that.graph,_that.formulas,_that.correctIndex);case GraphByFormulaQuestion() when graphByFormula != null:
return graphByFormula(_that.formula,_that.graphs,_that.correctIndex);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String equation,  int root)  linear,required TResult Function( String equation,  int discriminant)  discriminant,required TResult Function( String equation,  int rootCount)  rootCount,required TResult Function( String equation,  int discriminant,  int smallerRoot,  int largerRoot)  roots,required TResult Function( FunctionGraph graph,  List<String> formulas,  int correctIndex)  formulaByGraph,required TResult Function( String formula,  List<FunctionGraph> graphs,  int correctIndex)  graphByFormula,}) {final _that = this;
switch (_that) {
case LinearEquationQuestion():
return linear(_that.equation,_that.root);case DiscriminantQuestion():
return discriminant(_that.equation,_that.discriminant);case RootCountQuestion():
return rootCount(_that.equation,_that.rootCount);case RootsQuestion():
return roots(_that.equation,_that.discriminant,_that.smallerRoot,_that.largerRoot);case FormulaByGraphQuestion():
return formulaByGraph(_that.graph,_that.formulas,_that.correctIndex);case GraphByFormulaQuestion():
return graphByFormula(_that.formula,_that.graphs,_that.correctIndex);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String equation,  int root)?  linear,TResult? Function( String equation,  int discriminant)?  discriminant,TResult? Function( String equation,  int rootCount)?  rootCount,TResult? Function( String equation,  int discriminant,  int smallerRoot,  int largerRoot)?  roots,TResult? Function( FunctionGraph graph,  List<String> formulas,  int correctIndex)?  formulaByGraph,TResult? Function( String formula,  List<FunctionGraph> graphs,  int correctIndex)?  graphByFormula,}) {final _that = this;
switch (_that) {
case LinearEquationQuestion() when linear != null:
return linear(_that.equation,_that.root);case DiscriminantQuestion() when discriminant != null:
return discriminant(_that.equation,_that.discriminant);case RootCountQuestion() when rootCount != null:
return rootCount(_that.equation,_that.rootCount);case RootsQuestion() when roots != null:
return roots(_that.equation,_that.discriminant,_that.smallerRoot,_that.largerRoot);case FormulaByGraphQuestion() when formulaByGraph != null:
return formulaByGraph(_that.graph,_that.formulas,_that.correctIndex);case GraphByFormulaQuestion() when graphByFormula != null:
return graphByFormula(_that.formula,_that.graphs,_that.correctIndex);case _:
  return null;

}
}

}

/// @nodoc


class LinearEquationQuestion implements EquationQuestion {
  const LinearEquationQuestion({required this.equation, required this.root});
  

 final  String equation;
 final  int root;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinearEquationQuestionCopyWith<LinearEquationQuestion> get copyWith => _$LinearEquationQuestionCopyWithImpl<LinearEquationQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinearEquationQuestion&&(identical(other.equation, equation) || other.equation == equation)&&(identical(other.root, root) || other.root == root));
}


@override
int get hashCode => Object.hash(runtimeType,equation,root);

@override
String toString() {
  return 'EquationQuestion.linear(equation: $equation, root: $root)';
}


}

/// @nodoc
abstract mixin class $LinearEquationQuestionCopyWith<$Res> implements $EquationQuestionCopyWith<$Res> {
  factory $LinearEquationQuestionCopyWith(LinearEquationQuestion value, $Res Function(LinearEquationQuestion) _then) = _$LinearEquationQuestionCopyWithImpl;
@useResult
$Res call({
 String equation, int root
});




}
/// @nodoc
class _$LinearEquationQuestionCopyWithImpl<$Res>
    implements $LinearEquationQuestionCopyWith<$Res> {
  _$LinearEquationQuestionCopyWithImpl(this._self, this._then);

  final LinearEquationQuestion _self;
  final $Res Function(LinearEquationQuestion) _then;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? equation = null,Object? root = null,}) {
  return _then(LinearEquationQuestion(
equation: null == equation ? _self.equation : equation // ignore: cast_nullable_to_non_nullable
as String,root: null == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DiscriminantQuestion implements EquationQuestion {
  const DiscriminantQuestion({required this.equation, required this.discriminant});
  

 final  String equation;
 final  int discriminant;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscriminantQuestionCopyWith<DiscriminantQuestion> get copyWith => _$DiscriminantQuestionCopyWithImpl<DiscriminantQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscriminantQuestion&&(identical(other.equation, equation) || other.equation == equation)&&(identical(other.discriminant, discriminant) || other.discriminant == discriminant));
}


@override
int get hashCode => Object.hash(runtimeType,equation,discriminant);

@override
String toString() {
  return 'EquationQuestion.discriminant(equation: $equation, discriminant: $discriminant)';
}


}

/// @nodoc
abstract mixin class $DiscriminantQuestionCopyWith<$Res> implements $EquationQuestionCopyWith<$Res> {
  factory $DiscriminantQuestionCopyWith(DiscriminantQuestion value, $Res Function(DiscriminantQuestion) _then) = _$DiscriminantQuestionCopyWithImpl;
@useResult
$Res call({
 String equation, int discriminant
});




}
/// @nodoc
class _$DiscriminantQuestionCopyWithImpl<$Res>
    implements $DiscriminantQuestionCopyWith<$Res> {
  _$DiscriminantQuestionCopyWithImpl(this._self, this._then);

  final DiscriminantQuestion _self;
  final $Res Function(DiscriminantQuestion) _then;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? equation = null,Object? discriminant = null,}) {
  return _then(DiscriminantQuestion(
equation: null == equation ? _self.equation : equation // ignore: cast_nullable_to_non_nullable
as String,discriminant: null == discriminant ? _self.discriminant : discriminant // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RootCountQuestion implements EquationQuestion {
  const RootCountQuestion({required this.equation, required this.rootCount});
  

 final  String equation;
 final  int rootCount;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RootCountQuestionCopyWith<RootCountQuestion> get copyWith => _$RootCountQuestionCopyWithImpl<RootCountQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RootCountQuestion&&(identical(other.equation, equation) || other.equation == equation)&&(identical(other.rootCount, rootCount) || other.rootCount == rootCount));
}


@override
int get hashCode => Object.hash(runtimeType,equation,rootCount);

@override
String toString() {
  return 'EquationQuestion.rootCount(equation: $equation, rootCount: $rootCount)';
}


}

/// @nodoc
abstract mixin class $RootCountQuestionCopyWith<$Res> implements $EquationQuestionCopyWith<$Res> {
  factory $RootCountQuestionCopyWith(RootCountQuestion value, $Res Function(RootCountQuestion) _then) = _$RootCountQuestionCopyWithImpl;
@useResult
$Res call({
 String equation, int rootCount
});




}
/// @nodoc
class _$RootCountQuestionCopyWithImpl<$Res>
    implements $RootCountQuestionCopyWith<$Res> {
  _$RootCountQuestionCopyWithImpl(this._self, this._then);

  final RootCountQuestion _self;
  final $Res Function(RootCountQuestion) _then;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? equation = null,Object? rootCount = null,}) {
  return _then(RootCountQuestion(
equation: null == equation ? _self.equation : equation // ignore: cast_nullable_to_non_nullable
as String,rootCount: null == rootCount ? _self.rootCount : rootCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RootsQuestion implements EquationQuestion {
  const RootsQuestion({required this.equation, required this.discriminant, required this.smallerRoot, required this.largerRoot});
  

 final  String equation;
 final  int discriminant;
 final  int smallerRoot;
 final  int largerRoot;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RootsQuestionCopyWith<RootsQuestion> get copyWith => _$RootsQuestionCopyWithImpl<RootsQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RootsQuestion&&(identical(other.equation, equation) || other.equation == equation)&&(identical(other.discriminant, discriminant) || other.discriminant == discriminant)&&(identical(other.smallerRoot, smallerRoot) || other.smallerRoot == smallerRoot)&&(identical(other.largerRoot, largerRoot) || other.largerRoot == largerRoot));
}


@override
int get hashCode => Object.hash(runtimeType,equation,discriminant,smallerRoot,largerRoot);

@override
String toString() {
  return 'EquationQuestion.roots(equation: $equation, discriminant: $discriminant, smallerRoot: $smallerRoot, largerRoot: $largerRoot)';
}


}

/// @nodoc
abstract mixin class $RootsQuestionCopyWith<$Res> implements $EquationQuestionCopyWith<$Res> {
  factory $RootsQuestionCopyWith(RootsQuestion value, $Res Function(RootsQuestion) _then) = _$RootsQuestionCopyWithImpl;
@useResult
$Res call({
 String equation, int discriminant, int smallerRoot, int largerRoot
});




}
/// @nodoc
class _$RootsQuestionCopyWithImpl<$Res>
    implements $RootsQuestionCopyWith<$Res> {
  _$RootsQuestionCopyWithImpl(this._self, this._then);

  final RootsQuestion _self;
  final $Res Function(RootsQuestion) _then;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? equation = null,Object? discriminant = null,Object? smallerRoot = null,Object? largerRoot = null,}) {
  return _then(RootsQuestion(
equation: null == equation ? _self.equation : equation // ignore: cast_nullable_to_non_nullable
as String,discriminant: null == discriminant ? _self.discriminant : discriminant // ignore: cast_nullable_to_non_nullable
as int,smallerRoot: null == smallerRoot ? _self.smallerRoot : smallerRoot // ignore: cast_nullable_to_non_nullable
as int,largerRoot: null == largerRoot ? _self.largerRoot : largerRoot // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class FormulaByGraphQuestion implements EquationQuestion {
  const FormulaByGraphQuestion({required this.graph, required final  List<String> formulas, required this.correctIndex}): _formulas = formulas;
  

 final  FunctionGraph graph;
 final  List<String> _formulas;
 List<String> get formulas {
  if (_formulas is EqualUnmodifiableListView) return _formulas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formulas);
}

 final  int correctIndex;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaByGraphQuestionCopyWith<FormulaByGraphQuestion> get copyWith => _$FormulaByGraphQuestionCopyWithImpl<FormulaByGraphQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaByGraphQuestion&&(identical(other.graph, graph) || other.graph == graph)&&const DeepCollectionEquality().equals(other._formulas, _formulas)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex));
}


@override
int get hashCode => Object.hash(runtimeType,graph,const DeepCollectionEquality().hash(_formulas),correctIndex);

@override
String toString() {
  return 'EquationQuestion.formulaByGraph(graph: $graph, formulas: $formulas, correctIndex: $correctIndex)';
}


}

/// @nodoc
abstract mixin class $FormulaByGraphQuestionCopyWith<$Res> implements $EquationQuestionCopyWith<$Res> {
  factory $FormulaByGraphQuestionCopyWith(FormulaByGraphQuestion value, $Res Function(FormulaByGraphQuestion) _then) = _$FormulaByGraphQuestionCopyWithImpl;
@useResult
$Res call({
 FunctionGraph graph, List<String> formulas, int correctIndex
});


$FunctionGraphCopyWith<$Res> get graph;

}
/// @nodoc
class _$FormulaByGraphQuestionCopyWithImpl<$Res>
    implements $FormulaByGraphQuestionCopyWith<$Res> {
  _$FormulaByGraphQuestionCopyWithImpl(this._self, this._then);

  final FormulaByGraphQuestion _self;
  final $Res Function(FormulaByGraphQuestion) _then;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? graph = null,Object? formulas = null,Object? correctIndex = null,}) {
  return _then(FormulaByGraphQuestion(
graph: null == graph ? _self.graph : graph // ignore: cast_nullable_to_non_nullable
as FunctionGraph,formulas: null == formulas ? _self._formulas : formulas // ignore: cast_nullable_to_non_nullable
as List<String>,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FunctionGraphCopyWith<$Res> get graph {
  
  return $FunctionGraphCopyWith<$Res>(_self.graph, (value) {
    return _then(_self.copyWith(graph: value));
  });
}
}

/// @nodoc


class GraphByFormulaQuestion implements EquationQuestion {
  const GraphByFormulaQuestion({required this.formula, required final  List<FunctionGraph> graphs, required this.correctIndex}): _graphs = graphs;
  

 final  String formula;
 final  List<FunctionGraph> _graphs;
 List<FunctionGraph> get graphs {
  if (_graphs is EqualUnmodifiableListView) return _graphs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_graphs);
}

 final  int correctIndex;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphByFormulaQuestionCopyWith<GraphByFormulaQuestion> get copyWith => _$GraphByFormulaQuestionCopyWithImpl<GraphByFormulaQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphByFormulaQuestion&&(identical(other.formula, formula) || other.formula == formula)&&const DeepCollectionEquality().equals(other._graphs, _graphs)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex));
}


@override
int get hashCode => Object.hash(runtimeType,formula,const DeepCollectionEquality().hash(_graphs),correctIndex);

@override
String toString() {
  return 'EquationQuestion.graphByFormula(formula: $formula, graphs: $graphs, correctIndex: $correctIndex)';
}


}

/// @nodoc
abstract mixin class $GraphByFormulaQuestionCopyWith<$Res> implements $EquationQuestionCopyWith<$Res> {
  factory $GraphByFormulaQuestionCopyWith(GraphByFormulaQuestion value, $Res Function(GraphByFormulaQuestion) _then) = _$GraphByFormulaQuestionCopyWithImpl;
@useResult
$Res call({
 String formula, List<FunctionGraph> graphs, int correctIndex
});




}
/// @nodoc
class _$GraphByFormulaQuestionCopyWithImpl<$Res>
    implements $GraphByFormulaQuestionCopyWith<$Res> {
  _$GraphByFormulaQuestionCopyWithImpl(this._self, this._then);

  final GraphByFormulaQuestion _self;
  final $Res Function(GraphByFormulaQuestion) _then;

/// Create a copy of EquationQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? formula = null,Object? graphs = null,Object? correctIndex = null,}) {
  return _then(GraphByFormulaQuestion(
formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,graphs: null == graphs ? _self._graphs : graphs // ignore: cast_nullable_to_non_nullable
as List<FunctionGraph>,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
