// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'function_graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FunctionGraph {

 GraphViewport get viewport; List<List<Point<double>>> get segments; Point<double> get markedPoint; String get markedXLabel; String get markedYLabel;
/// Create a copy of FunctionGraph
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FunctionGraphCopyWith<FunctionGraph> get copyWith => _$FunctionGraphCopyWithImpl<FunctionGraph>(this as FunctionGraph, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FunctionGraph&&(identical(other.viewport, viewport) || other.viewport == viewport)&&const DeepCollectionEquality().equals(other.segments, segments)&&(identical(other.markedPoint, markedPoint) || other.markedPoint == markedPoint)&&(identical(other.markedXLabel, markedXLabel) || other.markedXLabel == markedXLabel)&&(identical(other.markedYLabel, markedYLabel) || other.markedYLabel == markedYLabel));
}


@override
int get hashCode => Object.hash(runtimeType,viewport,const DeepCollectionEquality().hash(segments),markedPoint,markedXLabel,markedYLabel);

@override
String toString() {
  return 'FunctionGraph(viewport: $viewport, segments: $segments, markedPoint: $markedPoint, markedXLabel: $markedXLabel, markedYLabel: $markedYLabel)';
}


}

/// @nodoc
abstract mixin class $FunctionGraphCopyWith<$Res>  {
  factory $FunctionGraphCopyWith(FunctionGraph value, $Res Function(FunctionGraph) _then) = _$FunctionGraphCopyWithImpl;
@useResult
$Res call({
 GraphViewport viewport, List<List<Point<double>>> segments, Point<double> markedPoint, String markedXLabel, String markedYLabel
});


$GraphViewportCopyWith<$Res> get viewport;

}
/// @nodoc
class _$FunctionGraphCopyWithImpl<$Res>
    implements $FunctionGraphCopyWith<$Res> {
  _$FunctionGraphCopyWithImpl(this._self, this._then);

  final FunctionGraph _self;
  final $Res Function(FunctionGraph) _then;

/// Create a copy of FunctionGraph
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewport = null,Object? segments = null,Object? markedPoint = null,Object? markedXLabel = null,Object? markedYLabel = null,}) {
  return _then(_self.copyWith(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as GraphViewport,segments: null == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<List<Point<double>>>,markedPoint: null == markedPoint ? _self.markedPoint : markedPoint // ignore: cast_nullable_to_non_nullable
as Point<double>,markedXLabel: null == markedXLabel ? _self.markedXLabel : markedXLabel // ignore: cast_nullable_to_non_nullable
as String,markedYLabel: null == markedYLabel ? _self.markedYLabel : markedYLabel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of FunctionGraph
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GraphViewportCopyWith<$Res> get viewport {
  
  return $GraphViewportCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}
}


/// Adds pattern-matching-related methods to [FunctionGraph].
extension FunctionGraphPatterns on FunctionGraph {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FunctionGraph value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FunctionGraph() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FunctionGraph value)  $default,){
final _that = this;
switch (_that) {
case _FunctionGraph():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FunctionGraph value)?  $default,){
final _that = this;
switch (_that) {
case _FunctionGraph() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GraphViewport viewport,  List<List<Point<double>>> segments,  Point<double> markedPoint,  String markedXLabel,  String markedYLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FunctionGraph() when $default != null:
return $default(_that.viewport,_that.segments,_that.markedPoint,_that.markedXLabel,_that.markedYLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GraphViewport viewport,  List<List<Point<double>>> segments,  Point<double> markedPoint,  String markedXLabel,  String markedYLabel)  $default,) {final _that = this;
switch (_that) {
case _FunctionGraph():
return $default(_that.viewport,_that.segments,_that.markedPoint,_that.markedXLabel,_that.markedYLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GraphViewport viewport,  List<List<Point<double>>> segments,  Point<double> markedPoint,  String markedXLabel,  String markedYLabel)?  $default,) {final _that = this;
switch (_that) {
case _FunctionGraph() when $default != null:
return $default(_that.viewport,_that.segments,_that.markedPoint,_that.markedXLabel,_that.markedYLabel);case _:
  return null;

}
}

}

/// @nodoc


class _FunctionGraph implements FunctionGraph {
  const _FunctionGraph({required this.viewport, required final  List<List<Point<double>>> segments, required this.markedPoint, required this.markedXLabel, required this.markedYLabel}): _segments = segments;
  

@override final  GraphViewport viewport;
 final  List<List<Point<double>>> _segments;
@override List<List<Point<double>>> get segments {
  if (_segments is EqualUnmodifiableListView) return _segments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segments);
}

@override final  Point<double> markedPoint;
@override final  String markedXLabel;
@override final  String markedYLabel;

/// Create a copy of FunctionGraph
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FunctionGraphCopyWith<_FunctionGraph> get copyWith => __$FunctionGraphCopyWithImpl<_FunctionGraph>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FunctionGraph&&(identical(other.viewport, viewport) || other.viewport == viewport)&&const DeepCollectionEquality().equals(other._segments, _segments)&&(identical(other.markedPoint, markedPoint) || other.markedPoint == markedPoint)&&(identical(other.markedXLabel, markedXLabel) || other.markedXLabel == markedXLabel)&&(identical(other.markedYLabel, markedYLabel) || other.markedYLabel == markedYLabel));
}


@override
int get hashCode => Object.hash(runtimeType,viewport,const DeepCollectionEquality().hash(_segments),markedPoint,markedXLabel,markedYLabel);

@override
String toString() {
  return 'FunctionGraph(viewport: $viewport, segments: $segments, markedPoint: $markedPoint, markedXLabel: $markedXLabel, markedYLabel: $markedYLabel)';
}


}

/// @nodoc
abstract mixin class _$FunctionGraphCopyWith<$Res> implements $FunctionGraphCopyWith<$Res> {
  factory _$FunctionGraphCopyWith(_FunctionGraph value, $Res Function(_FunctionGraph) _then) = __$FunctionGraphCopyWithImpl;
@override @useResult
$Res call({
 GraphViewport viewport, List<List<Point<double>>> segments, Point<double> markedPoint, String markedXLabel, String markedYLabel
});


@override $GraphViewportCopyWith<$Res> get viewport;

}
/// @nodoc
class __$FunctionGraphCopyWithImpl<$Res>
    implements _$FunctionGraphCopyWith<$Res> {
  __$FunctionGraphCopyWithImpl(this._self, this._then);

  final _FunctionGraph _self;
  final $Res Function(_FunctionGraph) _then;

/// Create a copy of FunctionGraph
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewport = null,Object? segments = null,Object? markedPoint = null,Object? markedXLabel = null,Object? markedYLabel = null,}) {
  return _then(_FunctionGraph(
viewport: null == viewport ? _self.viewport : viewport // ignore: cast_nullable_to_non_nullable
as GraphViewport,segments: null == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<List<Point<double>>>,markedPoint: null == markedPoint ? _self.markedPoint : markedPoint // ignore: cast_nullable_to_non_nullable
as Point<double>,markedXLabel: null == markedXLabel ? _self.markedXLabel : markedXLabel // ignore: cast_nullable_to_non_nullable
as String,markedYLabel: null == markedYLabel ? _self.markedYLabel : markedYLabel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of FunctionGraph
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GraphViewportCopyWith<$Res> get viewport {
  
  return $GraphViewportCopyWith<$Res>(_self.viewport, (value) {
    return _then(_self.copyWith(viewport: value));
  });
}
}

// dart format on
