// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Location _$LocationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'latLng':
      return _LocationLatLng.fromJson(json);
    case 'gridLocator':
      return _LocationGridLocator.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Location',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Location {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude) latLng,
    required TResult Function(String gridLocator) gridLocator,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? latLng,
    TResult? Function(String gridLocator)? gridLocator,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? latLng,
    TResult Function(String gridLocator)? gridLocator,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocationLatLng value) latLng,
    required TResult Function(_LocationGridLocator value) gridLocator,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocationLatLng value)? latLng,
    TResult? Function(_LocationGridLocator value)? gridLocator,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocationLatLng value)? latLng,
    TResult Function(_LocationGridLocator value)? gridLocator,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LocationLatLngImplCopyWith<$Res> {
  factory _$$LocationLatLngImplCopyWith(_$LocationLatLngImpl value,
          $Res Function(_$LocationLatLngImpl) then) =
      __$$LocationLatLngImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$LocationLatLngImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationLatLngImpl>
    implements _$$LocationLatLngImplCopyWith<$Res> {
  __$$LocationLatLngImplCopyWithImpl(
      _$LocationLatLngImpl _value, $Res Function(_$LocationLatLngImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationLatLngImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationLatLngImpl implements _LocationLatLng {
  const _$LocationLatLngImpl(
      {required this.latitude, required this.longitude, final String? $type})
      : $type = $type ?? 'latLng';

  factory _$LocationLatLngImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationLatLngImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Location.latLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationLatLngImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationLatLngImplCopyWith<_$LocationLatLngImpl> get copyWith =>
      __$$LocationLatLngImplCopyWithImpl<_$LocationLatLngImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude) latLng,
    required TResult Function(String gridLocator) gridLocator,
  }) {
    return latLng(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? latLng,
    TResult? Function(String gridLocator)? gridLocator,
  }) {
    return latLng?.call(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? latLng,
    TResult Function(String gridLocator)? gridLocator,
    required TResult orElse(),
  }) {
    if (latLng != null) {
      return latLng(latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocationLatLng value) latLng,
    required TResult Function(_LocationGridLocator value) gridLocator,
  }) {
    return latLng(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocationLatLng value)? latLng,
    TResult? Function(_LocationGridLocator value)? gridLocator,
  }) {
    return latLng?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocationLatLng value)? latLng,
    TResult Function(_LocationGridLocator value)? gridLocator,
    required TResult orElse(),
  }) {
    if (latLng != null) {
      return latLng(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationLatLngImplToJson(
      this,
    );
  }
}

abstract class _LocationLatLng implements Location {
  const factory _LocationLatLng(
      {required final double latitude,
      required final double longitude}) = _$LocationLatLngImpl;

  factory _LocationLatLng.fromJson(Map<String, dynamic> json) =
      _$LocationLatLngImpl.fromJson;

  double get latitude;
  double get longitude;
  @JsonKey(ignore: true)
  _$$LocationLatLngImplCopyWith<_$LocationLatLngImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationGridLocatorImplCopyWith<$Res> {
  factory _$$LocationGridLocatorImplCopyWith(_$LocationGridLocatorImpl value,
          $Res Function(_$LocationGridLocatorImpl) then) =
      __$$LocationGridLocatorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String gridLocator});
}

/// @nodoc
class __$$LocationGridLocatorImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationGridLocatorImpl>
    implements _$$LocationGridLocatorImplCopyWith<$Res> {
  __$$LocationGridLocatorImplCopyWithImpl(_$LocationGridLocatorImpl _value,
      $Res Function(_$LocationGridLocatorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridLocator = null,
  }) {
    return _then(_$LocationGridLocatorImpl(
      gridLocator: null == gridLocator
          ? _value.gridLocator
          : gridLocator // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationGridLocatorImpl implements _LocationGridLocator {
  const _$LocationGridLocatorImpl(
      {required this.gridLocator, final String? $type})
      : $type = $type ?? 'gridLocator';

  factory _$LocationGridLocatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationGridLocatorImplFromJson(json);

  @override
  final String gridLocator;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Location.gridLocator(gridLocator: $gridLocator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationGridLocatorImpl &&
            (identical(other.gridLocator, gridLocator) ||
                other.gridLocator == gridLocator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gridLocator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationGridLocatorImplCopyWith<_$LocationGridLocatorImpl> get copyWith =>
      __$$LocationGridLocatorImplCopyWithImpl<_$LocationGridLocatorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude) latLng,
    required TResult Function(String gridLocator) gridLocator,
  }) {
    return gridLocator(this.gridLocator);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude)? latLng,
    TResult? Function(String gridLocator)? gridLocator,
  }) {
    return gridLocator?.call(this.gridLocator);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude)? latLng,
    TResult Function(String gridLocator)? gridLocator,
    required TResult orElse(),
  }) {
    if (gridLocator != null) {
      return gridLocator(this.gridLocator);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocationLatLng value) latLng,
    required TResult Function(_LocationGridLocator value) gridLocator,
  }) {
    return gridLocator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocationLatLng value)? latLng,
    TResult? Function(_LocationGridLocator value)? gridLocator,
  }) {
    return gridLocator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocationLatLng value)? latLng,
    TResult Function(_LocationGridLocator value)? gridLocator,
    required TResult orElse(),
  }) {
    if (gridLocator != null) {
      return gridLocator(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationGridLocatorImplToJson(
      this,
    );
  }
}

abstract class _LocationGridLocator implements Location {
  const factory _LocationGridLocator({required final String gridLocator}) =
      _$LocationGridLocatorImpl;

  factory _LocationGridLocator.fromJson(Map<String, dynamic> json) =
      _$LocationGridLocatorImpl.fromJson;

  String get gridLocator;
  @JsonKey(ignore: true)
  _$$LocationGridLocatorImplCopyWith<_$LocationGridLocatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
