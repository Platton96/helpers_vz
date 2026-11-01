// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AreaQuestion {

 AreaFigure get figure; List<Point<double>> get outline; List<FigureMeasurement> get measurements; int get answer;
/// Create a copy of AreaQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaQuestionCopyWith<AreaQuestion> get copyWith => _$AreaQuestionCopyWithImpl<AreaQuestion>(this as AreaQuestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AreaQuestion&&(identical(other.figure, figure) || other.figure == figure)&&const DeepCollectionEquality().equals(other.outline, outline)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,figure,const DeepCollectionEquality().hash(outline),const DeepCollectionEquality().hash(measurements),answer);

@override
String toString() {
  return 'AreaQuestion(figure: $figure, outline: $outline, measurements: $measurements, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $AreaQuestionCopyWith<$Res>  {
  factory $AreaQuestionCopyWith(AreaQuestion value, $Res Function(AreaQuestion) _then) = _$AreaQuestionCopyWithImpl;
@useResult
$Res call({
 AreaFigure figure, List<Point<double>> outline, List<FigureMeasurement> measurements, int answer
});




}
/// @nodoc
class _$AreaQuestionCopyWithImpl<$Res>
    implements $AreaQuestionCopyWith<$Res> {
  _$AreaQuestionCopyWithImpl(this._self, this._then);

  final AreaQuestion _self;
  final $Res Function(AreaQuestion) _then;

/// Create a copy of AreaQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? figure = null,Object? outline = null,Object? measurements = null,Object? answer = null,}) {
  return _then(_self.copyWith(
figure: null == figure ? _self.figure : figure // ignore: cast_nullable_to_non_nullable
as AreaFigure,outline: null == outline ? _self.outline : outline // ignore: cast_nullable_to_non_nullable
as List<Point<double>>,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<FigureMeasurement>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AreaQuestion].
extension AreaQuestionPatterns on AreaQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AreaQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AreaQuestion() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AreaQuestion value)  $default,){
final _that = this;
switch (_that) {
case _AreaQuestion():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AreaQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _AreaQuestion() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AreaFigure figure,  List<Point<double>> outline,  List<FigureMeasurement> measurements,  int answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AreaQuestion() when $default != null:
return $default(_that.figure,_that.outline,_that.measurements,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AreaFigure figure,  List<Point<double>> outline,  List<FigureMeasurement> measurements,  int answer)  $default,) {final _that = this;
switch (_that) {
case _AreaQuestion():
return $default(_that.figure,_that.outline,_that.measurements,_that.answer);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AreaFigure figure,  List<Point<double>> outline,  List<FigureMeasurement> measurements,  int answer)?  $default,) {final _that = this;
switch (_that) {
case _AreaQuestion() when $default != null:
return $default(_that.figure,_that.outline,_that.measurements,_that.answer);case _:
  return null;

}
}

}

/// @nodoc


class _AreaQuestion implements AreaQuestion {
  const _AreaQuestion({required this.figure, required final  List<Point<double>> outline, required final  List<FigureMeasurement> measurements, required this.answer}): _outline = outline,_measurements = measurements;
  

@override final  AreaFigure figure;
 final  List<Point<double>> _outline;
@override List<Point<double>> get outline {
  if (_outline is EqualUnmodifiableListView) return _outline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outline);
}

 final  List<FigureMeasurement> _measurements;
@override List<FigureMeasurement> get measurements {
  if (_measurements is EqualUnmodifiableListView) return _measurements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_measurements);
}

@override final  int answer;

/// Create a copy of AreaQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaQuestionCopyWith<_AreaQuestion> get copyWith => __$AreaQuestionCopyWithImpl<_AreaQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AreaQuestion&&(identical(other.figure, figure) || other.figure == figure)&&const DeepCollectionEquality().equals(other._outline, _outline)&&const DeepCollectionEquality().equals(other._measurements, _measurements)&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,figure,const DeepCollectionEquality().hash(_outline),const DeepCollectionEquality().hash(_measurements),answer);

@override
String toString() {
  return 'AreaQuestion(figure: $figure, outline: $outline, measurements: $measurements, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$AreaQuestionCopyWith<$Res> implements $AreaQuestionCopyWith<$Res> {
  factory _$AreaQuestionCopyWith(_AreaQuestion value, $Res Function(_AreaQuestion) _then) = __$AreaQuestionCopyWithImpl;
@override @useResult
$Res call({
 AreaFigure figure, List<Point<double>> outline, List<FigureMeasurement> measurements, int answer
});




}
/// @nodoc
class __$AreaQuestionCopyWithImpl<$Res>
    implements _$AreaQuestionCopyWith<$Res> {
  __$AreaQuestionCopyWithImpl(this._self, this._then);

  final _AreaQuestion _self;
  final $Res Function(_AreaQuestion) _then;

/// Create a copy of AreaQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? figure = null,Object? outline = null,Object? measurements = null,Object? answer = null,}) {
  return _then(_AreaQuestion(
figure: null == figure ? _self.figure : figure // ignore: cast_nullable_to_non_nullable
as AreaFigure,outline: null == outline ? _self._outline : outline // ignore: cast_nullable_to_non_nullable
as List<Point<double>>,measurements: null == measurements ? _self._measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<FigureMeasurement>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
