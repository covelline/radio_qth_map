// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OperationInfo _$OperationInfoFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'amateur':
      return AmateurRadioOperationInfo.fromJson(json);
    case 'freeLicense':
      return FreeLicenseRadioOperationInfo.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OperationInfo',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OperationInfo {
  /// firestoreのID
  String? get id => throw _privateConstructorUsedError;

  /// 運用モード
  Enum get mode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)
        amateur,
    required TResult Function(String? id, FreeLicenseRadioMode mode)
        freeLicense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)?
        amateur,
    TResult? Function(String? id, FreeLicenseRadioMode mode)? freeLicense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)?
        amateur,
    TResult Function(String? id, FreeLicenseRadioMode mode)? freeLicense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmateurRadioOperationInfo value) amateur,
    required TResult Function(FreeLicenseRadioOperationInfo value) freeLicense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmateurRadioOperationInfo value)? amateur,
    TResult? Function(FreeLicenseRadioOperationInfo value)? freeLicense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmateurRadioOperationInfo value)? amateur,
    TResult Function(FreeLicenseRadioOperationInfo value)? freeLicense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperationInfoCopyWith<OperationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationInfoCopyWith<$Res> {
  factory $OperationInfoCopyWith(
          OperationInfo value, $Res Function(OperationInfo) then) =
      _$OperationInfoCopyWithImpl<$Res, OperationInfo>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$OperationInfoCopyWithImpl<$Res, $Val extends OperationInfo>
    implements $OperationInfoCopyWith<$Res> {
  _$OperationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AmateurRadioOperationInfoImplCopyWith<$Res>
    implements $OperationInfoCopyWith<$Res> {
  factory _$$AmateurRadioOperationInfoImplCopyWith(
          _$AmateurRadioOperationInfoImpl value,
          $Res Function(_$AmateurRadioOperationInfoImpl) then) =
      __$$AmateurRadioOperationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      AmateurRadioMode mode,
      AmateurRadioBandInfo band,
      double powerOutput});

  $AmateurRadioBandInfoCopyWith<$Res> get band;
}

/// @nodoc
class __$$AmateurRadioOperationInfoImplCopyWithImpl<$Res>
    extends _$OperationInfoCopyWithImpl<$Res, _$AmateurRadioOperationInfoImpl>
    implements _$$AmateurRadioOperationInfoImplCopyWith<$Res> {
  __$$AmateurRadioOperationInfoImplCopyWithImpl(
      _$AmateurRadioOperationInfoImpl _value,
      $Res Function(_$AmateurRadioOperationInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mode = null,
    Object? band = null,
    Object? powerOutput = null,
  }) {
    return _then(_$AmateurRadioOperationInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AmateurRadioMode,
      band: null == band
          ? _value.band
          : band // ignore: cast_nullable_to_non_nullable
              as AmateurRadioBandInfo,
      powerOutput: null == powerOutput
          ? _value.powerOutput
          : powerOutput // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AmateurRadioBandInfoCopyWith<$Res> get band {
    return $AmateurRadioBandInfoCopyWith<$Res>(_value.band, (value) {
      return _then(_value.copyWith(band: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$AmateurRadioOperationInfoImpl implements AmateurRadioOperationInfo {
  const _$AmateurRadioOperationInfoImpl(
      {this.id,
      required this.mode,
      required this.band,
      required this.powerOutput,
      final String? $type})
      : $type = $type ?? 'amateur';

  factory _$AmateurRadioOperationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AmateurRadioOperationInfoImplFromJson(json);

  /// firestoreのID
  @override
  final String? id;

  /// 運用モード
  @override
  final AmateurRadioMode mode;

  /// 運用バンド
  @override
  final AmateurRadioBandInfo band;
  @override
  final double powerOutput;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OperationInfo.amateur(id: $id, mode: $mode, band: $band, powerOutput: $powerOutput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmateurRadioOperationInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.band, band) || other.band == band) &&
            (identical(other.powerOutput, powerOutput) ||
                other.powerOutput == powerOutput));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, mode, band, powerOutput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmateurRadioOperationInfoImplCopyWith<_$AmateurRadioOperationInfoImpl>
      get copyWith => __$$AmateurRadioOperationInfoImplCopyWithImpl<
          _$AmateurRadioOperationInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)
        amateur,
    required TResult Function(String? id, FreeLicenseRadioMode mode)
        freeLicense,
  }) {
    return amateur(id, mode, band, powerOutput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)?
        amateur,
    TResult? Function(String? id, FreeLicenseRadioMode mode)? freeLicense,
  }) {
    return amateur?.call(id, mode, band, powerOutput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)?
        amateur,
    TResult Function(String? id, FreeLicenseRadioMode mode)? freeLicense,
    required TResult orElse(),
  }) {
    if (amateur != null) {
      return amateur(id, mode, band, powerOutput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmateurRadioOperationInfo value) amateur,
    required TResult Function(FreeLicenseRadioOperationInfo value) freeLicense,
  }) {
    return amateur(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmateurRadioOperationInfo value)? amateur,
    TResult? Function(FreeLicenseRadioOperationInfo value)? freeLicense,
  }) {
    return amateur?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmateurRadioOperationInfo value)? amateur,
    TResult Function(FreeLicenseRadioOperationInfo value)? freeLicense,
    required TResult orElse(),
  }) {
    if (amateur != null) {
      return amateur(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AmateurRadioOperationInfoImplToJson(
      this,
    );
  }
}

abstract class AmateurRadioOperationInfo implements OperationInfo {
  const factory AmateurRadioOperationInfo(
      {final String? id,
      required final AmateurRadioMode mode,
      required final AmateurRadioBandInfo band,
      required final double powerOutput}) = _$AmateurRadioOperationInfoImpl;

  factory AmateurRadioOperationInfo.fromJson(Map<String, dynamic> json) =
      _$AmateurRadioOperationInfoImpl.fromJson;

  @override

  /// firestoreのID
  String? get id;
  @override

  /// 運用モード
  AmateurRadioMode get mode;

  /// 運用バンド
  AmateurRadioBandInfo get band;
  double get powerOutput;
  @override
  @JsonKey(ignore: true)
  _$$AmateurRadioOperationInfoImplCopyWith<_$AmateurRadioOperationInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FreeLicenseRadioOperationInfoImplCopyWith<$Res>
    implements $OperationInfoCopyWith<$Res> {
  factory _$$FreeLicenseRadioOperationInfoImplCopyWith(
          _$FreeLicenseRadioOperationInfoImpl value,
          $Res Function(_$FreeLicenseRadioOperationInfoImpl) then) =
      __$$FreeLicenseRadioOperationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, FreeLicenseRadioMode mode});
}

/// @nodoc
class __$$FreeLicenseRadioOperationInfoImplCopyWithImpl<$Res>
    extends _$OperationInfoCopyWithImpl<$Res,
        _$FreeLicenseRadioOperationInfoImpl>
    implements _$$FreeLicenseRadioOperationInfoImplCopyWith<$Res> {
  __$$FreeLicenseRadioOperationInfoImplCopyWithImpl(
      _$FreeLicenseRadioOperationInfoImpl _value,
      $Res Function(_$FreeLicenseRadioOperationInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mode = null,
  }) {
    return _then(_$FreeLicenseRadioOperationInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as FreeLicenseRadioMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FreeLicenseRadioOperationInfoImpl
    implements FreeLicenseRadioOperationInfo {
  const _$FreeLicenseRadioOperationInfoImpl(
      {this.id, required this.mode, final String? $type})
      : $type = $type ?? 'freeLicense';

  factory _$FreeLicenseRadioOperationInfoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FreeLicenseRadioOperationInfoImplFromJson(json);

  /// firestoreのID
  @override
  final String? id;

  /// モード
  @override
  final FreeLicenseRadioMode mode;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OperationInfo.freeLicense(id: $id, mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreeLicenseRadioOperationInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, mode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreeLicenseRadioOperationInfoImplCopyWith<
          _$FreeLicenseRadioOperationInfoImpl>
      get copyWith => __$$FreeLicenseRadioOperationInfoImplCopyWithImpl<
          _$FreeLicenseRadioOperationInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)
        amateur,
    required TResult Function(String? id, FreeLicenseRadioMode mode)
        freeLicense,
  }) {
    return freeLicense(id, mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)?
        amateur,
    TResult? Function(String? id, FreeLicenseRadioMode mode)? freeLicense,
  }) {
    return freeLicense?.call(id, mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, AmateurRadioMode mode,
            AmateurRadioBandInfo band, double powerOutput)?
        amateur,
    TResult Function(String? id, FreeLicenseRadioMode mode)? freeLicense,
    required TResult orElse(),
  }) {
    if (freeLicense != null) {
      return freeLicense(id, mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmateurRadioOperationInfo value) amateur,
    required TResult Function(FreeLicenseRadioOperationInfo value) freeLicense,
  }) {
    return freeLicense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmateurRadioOperationInfo value)? amateur,
    TResult? Function(FreeLicenseRadioOperationInfo value)? freeLicense,
  }) {
    return freeLicense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmateurRadioOperationInfo value)? amateur,
    TResult Function(FreeLicenseRadioOperationInfo value)? freeLicense,
    required TResult orElse(),
  }) {
    if (freeLicense != null) {
      return freeLicense(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FreeLicenseRadioOperationInfoImplToJson(
      this,
    );
  }
}

abstract class FreeLicenseRadioOperationInfo implements OperationInfo {
  const factory FreeLicenseRadioOperationInfo(
          {final String? id, required final FreeLicenseRadioMode mode}) =
      _$FreeLicenseRadioOperationInfoImpl;

  factory FreeLicenseRadioOperationInfo.fromJson(Map<String, dynamic> json) =
      _$FreeLicenseRadioOperationInfoImpl.fromJson;

  @override

  /// firestoreのID
  String? get id;
  @override

  /// モード
  FreeLicenseRadioMode get mode;
  @override
  @JsonKey(ignore: true)
  _$$FreeLicenseRadioOperationInfoImplCopyWith<
          _$FreeLicenseRadioOperationInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
