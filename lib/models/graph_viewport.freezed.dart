// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_viewport.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphViewport {

 double get minX; double get maxX; double get minY; double get maxY; double get gridStepX;
/// Create a copy of GraphViewport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphViewportCopyWith<GraphViewport> get copyWith => _$GraphViewportCopyWithImpl<GraphViewport>(this as GraphViewport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphViewport&&(identical(other.minX, minX) || other.minX == minX)&&(identical(other.maxX, maxX) || other.maxX == maxX)&&(identical(other.minY, minY) || other.minY == minY)&&(identical(other.maxY, maxY) || other.maxY == maxY)&&(identical(other.gridStepX, gridStepX) || other.gridStepX == gridStepX));
}


@override
int get hashCode => Object.hash(runtimeType,minX,maxX,minY,maxY,gridStepX);

@override
String toString() {
  return 'GraphViewport(minX: $minX, maxX: $maxX, minY: $minY, maxY: $maxY, gridStepX: $gridStepX)';
}


}

/// @nodoc
abstract mixin class $GraphViewportCopyWith<$Res>  {
  factory $GraphViewportCopyWith(GraphViewport value, $Res Function(GraphViewport) _then) = _$GraphViewportCopyWithImpl;
@useResult
$Res call({
 double minX, double maxX, double minY, double maxY, double gridStepX
});




}
/// @nodoc
class _$GraphViewportCopyWithImpl<$Res>
    implements $GraphViewportCopyWith<$Res> {
  _$GraphViewportCopyWithImpl(this._self, this._then);

  final GraphViewport _self;
  final $Res Function(GraphViewport) _then;

/// Create a copy of GraphViewport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minX = null,Object? maxX = null,Object? minY = null,Object? maxY = null,Object? gridStepX = null,}) {
  return _then(_self.copyWith(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,gridStepX: null == gridStepX ? _self.gridStepX : gridStepX // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphViewport].
extension GraphViewportPatterns on GraphViewport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphViewport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphViewport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphViewport value)  $default,){
final _that = this;
switch (_that) {
case _GraphViewport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphViewport value)?  $default,){
final _that = this;
switch (_that) {
case _GraphViewport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minX,  double maxX,  double minY,  double maxY,  double gridStepX)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphViewport() when $default != null:
return $default(_that.minX,_that.maxX,_that.minY,_that.maxY,_that.gridStepX);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minX,  double maxX,  double minY,  double maxY,  double gridStepX)  $default,) {final _that = this;
switch (_that) {
case _GraphViewport():
return $default(_that.minX,_that.maxX,_that.minY,_that.maxY,_that.gridStepX);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minX,  double maxX,  double minY,  double maxY,  double gridStepX)?  $default,) {final _that = this;
switch (_that) {
case _GraphViewport() when $default != null:
return $default(_that.minX,_that.maxX,_that.minY,_that.maxY,_that.gridStepX);case _:
  return null;

}
}

}

/// @nodoc


class _GraphViewport implements GraphViewport {
  const _GraphViewport({required this.minX, required this.maxX, required this.minY, required this.maxY, required this.gridStepX});
  

@override final  double minX;
@override final  double maxX;
@override final  double minY;
@override final  double maxY;
@override final  double gridStepX;

/// Create a copy of GraphViewport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphViewportCopyWith<_GraphViewport> get copyWith => __$GraphViewportCopyWithImpl<_GraphViewport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphViewport&&(identical(other.minX, minX) || other.minX == minX)&&(identical(other.maxX, maxX) || other.maxX == maxX)&&(identical(other.minY, minY) || other.minY == minY)&&(identical(other.maxY, maxY) || other.maxY == maxY)&&(identical(other.gridStepX, gridStepX) || other.gridStepX == gridStepX));
}


@override
int get hashCode => Object.hash(runtimeType,minX,maxX,minY,maxY,gridStepX);

@override
String toString() {
  return 'GraphViewport(minX: $minX, maxX: $maxX, minY: $minY, maxY: $maxY, gridStepX: $gridStepX)';
}


}

/// @nodoc
abstract mixin class _$GraphViewportCopyWith<$Res> implements $GraphViewportCopyWith<$Res> {
  factory _$GraphViewportCopyWith(_GraphViewport value, $Res Function(_GraphViewport) _then) = __$GraphViewportCopyWithImpl;
@override @useResult
$Res call({
 double minX, double maxX, double minY, double maxY, double gridStepX
});




}
/// @nodoc
class __$GraphViewportCopyWithImpl<$Res>
    implements _$GraphViewportCopyWith<$Res> {
  __$GraphViewportCopyWithImpl(this._self, this._then);

  final _GraphViewport _self;
  final $Res Function(_GraphViewport) _then;

/// Create a copy of GraphViewport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minX = null,Object? maxX = null,Object? minY = null,Object? maxY = null,Object? gridStepX = null,}) {
  return _then(_GraphViewport(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,gridStepX: null == gridStepX ? _self.gridStepX : gridStepX // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
