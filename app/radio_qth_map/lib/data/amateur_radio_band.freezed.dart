// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amateur_radio_band.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AmateurRadioBandInfo _$AmateurRadioBandInfoFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'band':
      return _AmateurRadioBandInfoBand.fromJson(json);
    case 'frequency':
      return _AmateureRadioBandInfoFrequency.fromJson(json);
    case 'bandAndFrequency':
      return _AmateureRadioBandInfoBandAndFrequency.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'AmateurRadioBandInfo',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AmateurRadioBandInfo {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AmateurRadioBand band) band,
    required TResult Function(double frequency) frequency,
    required TResult Function(AmateurRadioBand band, double frequency)
        bandAndFrequency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AmateurRadioBand band)? band,
    TResult? Function(double frequency)? frequency,
    TResult? Function(AmateurRadioBand band, double frequency)?
        bandAndFrequency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AmateurRadioBand band)? band,
    TResult Function(double frequency)? frequency,
    TResult Function(AmateurRadioBand band, double frequency)? bandAndFrequency,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmateurRadioBandInfoBand value) band,
    required TResult Function(_AmateureRadioBandInfoFrequency value) frequency,
    required TResult Function(_AmateureRadioBandInfoBandAndFrequency value)
        bandAndFrequency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmateurRadioBandInfoBand value)? band,
    TResult? Function(_AmateureRadioBandInfoFrequency value)? frequency,
    TResult? Function(_AmateureRadioBandInfoBandAndFrequency value)?
        bandAndFrequency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmateurRadioBandInfoBand value)? band,
    TResult Function(_AmateureRadioBandInfoFrequency value)? frequency,
    TResult Function(_AmateureRadioBandInfoBandAndFrequency value)?
        bandAndFrequency,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmateurRadioBandInfoCopyWith<$Res> {
  factory $AmateurRadioBandInfoCopyWith(AmateurRadioBandInfo value,
          $Res Function(AmateurRadioBandInfo) then) =
      _$AmateurRadioBandInfoCopyWithImpl<$Res, AmateurRadioBandInfo>;
}

/// @nodoc
class _$AmateurRadioBandInfoCopyWithImpl<$Res,
        $Val extends AmateurRadioBandInfo>
    implements $AmateurRadioBandInfoCopyWith<$Res> {
  _$AmateurRadioBandInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AmateurRadioBandInfoBandImplCopyWith<$Res> {
  factory _$$AmateurRadioBandInfoBandImplCopyWith(
          _$AmateurRadioBandInfoBandImpl value,
          $Res Function(_$AmateurRadioBandInfoBandImpl) then) =
      __$$AmateurRadioBandInfoBandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AmateurRadioBand band});
}

/// @nodoc
class __$$AmateurRadioBandInfoBandImplCopyWithImpl<$Res>
    extends _$AmateurRadioBandInfoCopyWithImpl<$Res,
        _$AmateurRadioBandInfoBandImpl>
    implements _$$AmateurRadioBandInfoBandImplCopyWith<$Res> {
  __$$AmateurRadioBandInfoBandImplCopyWithImpl(
      _$AmateurRadioBandInfoBandImpl _value,
      $Res Function(_$AmateurRadioBandInfoBandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? band = null,
  }) {
    return _then(_$AmateurRadioBandInfoBandImpl(
      band: null == band
          ? _value.band
          : band // ignore: cast_nullable_to_non_nullable
              as AmateurRadioBand,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AmateurRadioBandInfoBandImpl implements _AmateurRadioBandInfoBand {
  const _$AmateurRadioBandInfoBandImpl(
      {required this.band, final String? $type})
      : $type = $type ?? 'band';

  factory _$AmateurRadioBandInfoBandImpl.fromJson(Map<String, dynamic> json) =>
      _$$AmateurRadioBandInfoBandImplFromJson(json);

  @override
  final AmateurRadioBand band;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AmateurRadioBandInfo.band(band: $band)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmateurRadioBandInfoBandImpl &&
            (identical(other.band, band) || other.band == band));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, band);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmateurRadioBandInfoBandImplCopyWith<_$AmateurRadioBandInfoBandImpl>
      get copyWith => __$$AmateurRadioBandInfoBandImplCopyWithImpl<
          _$AmateurRadioBandInfoBandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AmateurRadioBand band) band,
    required TResult Function(double frequency) frequency,
    required TResult Function(AmateurRadioBand band, double frequency)
        bandAndFrequency,
  }) {
    return band(this.band);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AmateurRadioBand band)? band,
    TResult? Function(double frequency)? frequency,
    TResult? Function(AmateurRadioBand band, double frequency)?
        bandAndFrequency,
  }) {
    return band?.call(this.band);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AmateurRadioBand band)? band,
    TResult Function(double frequency)? frequency,
    TResult Function(AmateurRadioBand band, double frequency)? bandAndFrequency,
    required TResult orElse(),
  }) {
    if (band != null) {
      return band(this.band);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmateurRadioBandInfoBand value) band,
    required TResult Function(_AmateureRadioBandInfoFrequency value) frequency,
    required TResult Function(_AmateureRadioBandInfoBandAndFrequency value)
        bandAndFrequency,
  }) {
    return band(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmateurRadioBandInfoBand value)? band,
    TResult? Function(_AmateureRadioBandInfoFrequency value)? frequency,
    TResult? Function(_AmateureRadioBandInfoBandAndFrequency value)?
        bandAndFrequency,
  }) {
    return band?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmateurRadioBandInfoBand value)? band,
    TResult Function(_AmateureRadioBandInfoFrequency value)? frequency,
    TResult Function(_AmateureRadioBandInfoBandAndFrequency value)?
        bandAndFrequency,
    required TResult orElse(),
  }) {
    if (band != null) {
      return band(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AmateurRadioBandInfoBandImplToJson(
      this,
    );
  }
}

abstract class _AmateurRadioBandInfoBand implements AmateurRadioBandInfo {
  const factory _AmateurRadioBandInfoBand(
      {required final AmateurRadioBand band}) = _$AmateurRadioBandInfoBandImpl;

  factory _AmateurRadioBandInfoBand.fromJson(Map<String, dynamic> json) =
      _$AmateurRadioBandInfoBandImpl.fromJson;

  AmateurRadioBand get band;
  @JsonKey(ignore: true)
  _$$AmateurRadioBandInfoBandImplCopyWith<_$AmateurRadioBandInfoBandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AmateureRadioBandInfoFrequencyImplCopyWith<$Res> {
  factory _$$AmateureRadioBandInfoFrequencyImplCopyWith(
          _$AmateureRadioBandInfoFrequencyImpl value,
          $Res Function(_$AmateureRadioBandInfoFrequencyImpl) then) =
      __$$AmateureRadioBandInfoFrequencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double frequency});
}

/// @nodoc
class __$$AmateureRadioBandInfoFrequencyImplCopyWithImpl<$Res>
    extends _$AmateurRadioBandInfoCopyWithImpl<$Res,
        _$AmateureRadioBandInfoFrequencyImpl>
    implements _$$AmateureRadioBandInfoFrequencyImplCopyWith<$Res> {
  __$$AmateureRadioBandInfoFrequencyImplCopyWithImpl(
      _$AmateureRadioBandInfoFrequencyImpl _value,
      $Res Function(_$AmateureRadioBandInfoFrequencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
  }) {
    return _then(_$AmateureRadioBandInfoFrequencyImpl(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AmateureRadioBandInfoFrequencyImpl
    implements _AmateureRadioBandInfoFrequency {
  const _$AmateureRadioBandInfoFrequencyImpl(
      {required this.frequency, final String? $type})
      : $type = $type ?? 'frequency';

  factory _$AmateureRadioBandInfoFrequencyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AmateureRadioBandInfoFrequencyImplFromJson(json);

  @override
  final double frequency;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AmateurRadioBandInfo.frequency(frequency: $frequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmateureRadioBandInfoFrequencyImpl &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, frequency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmateureRadioBandInfoFrequencyImplCopyWith<
          _$AmateureRadioBandInfoFrequencyImpl>
      get copyWith => __$$AmateureRadioBandInfoFrequencyImplCopyWithImpl<
          _$AmateureRadioBandInfoFrequencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AmateurRadioBand band) band,
    required TResult Function(double frequency) frequency,
    required TResult Function(AmateurRadioBand band, double frequency)
        bandAndFrequency,
  }) {
    return frequency(this.frequency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AmateurRadioBand band)? band,
    TResult? Function(double frequency)? frequency,
    TResult? Function(AmateurRadioBand band, double frequency)?
        bandAndFrequency,
  }) {
    return frequency?.call(this.frequency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AmateurRadioBand band)? band,
    TResult Function(double frequency)? frequency,
    TResult Function(AmateurRadioBand band, double frequency)? bandAndFrequency,
    required TResult orElse(),
  }) {
    if (frequency != null) {
      return frequency(this.frequency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmateurRadioBandInfoBand value) band,
    required TResult Function(_AmateureRadioBandInfoFrequency value) frequency,
    required TResult Function(_AmateureRadioBandInfoBandAndFrequency value)
        bandAndFrequency,
  }) {
    return frequency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmateurRadioBandInfoBand value)? band,
    TResult? Function(_AmateureRadioBandInfoFrequency value)? frequency,
    TResult? Function(_AmateureRadioBandInfoBandAndFrequency value)?
        bandAndFrequency,
  }) {
    return frequency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmateurRadioBandInfoBand value)? band,
    TResult Function(_AmateureRadioBandInfoFrequency value)? frequency,
    TResult Function(_AmateureRadioBandInfoBandAndFrequency value)?
        bandAndFrequency,
    required TResult orElse(),
  }) {
    if (frequency != null) {
      return frequency(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AmateureRadioBandInfoFrequencyImplToJson(
      this,
    );
  }
}

abstract class _AmateureRadioBandInfoFrequency implements AmateurRadioBandInfo {
  const factory _AmateureRadioBandInfoFrequency(
      {required final double frequency}) = _$AmateureRadioBandInfoFrequencyImpl;

  factory _AmateureRadioBandInfoFrequency.fromJson(Map<String, dynamic> json) =
      _$AmateureRadioBandInfoFrequencyImpl.fromJson;

  double get frequency;
  @JsonKey(ignore: true)
  _$$AmateureRadioBandInfoFrequencyImplCopyWith<
          _$AmateureRadioBandInfoFrequencyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AmateureRadioBandInfoBandAndFrequencyImplCopyWith<$Res> {
  factory _$$AmateureRadioBandInfoBandAndFrequencyImplCopyWith(
          _$AmateureRadioBandInfoBandAndFrequencyImpl value,
          $Res Function(_$AmateureRadioBandInfoBandAndFrequencyImpl) then) =
      __$$AmateureRadioBandInfoBandAndFrequencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AmateurRadioBand band, double frequency});
}

/// @nodoc
class __$$AmateureRadioBandInfoBandAndFrequencyImplCopyWithImpl<$Res>
    extends _$AmateurRadioBandInfoCopyWithImpl<$Res,
        _$AmateureRadioBandInfoBandAndFrequencyImpl>
    implements _$$AmateureRadioBandInfoBandAndFrequencyImplCopyWith<$Res> {
  __$$AmateureRadioBandInfoBandAndFrequencyImplCopyWithImpl(
      _$AmateureRadioBandInfoBandAndFrequencyImpl _value,
      $Res Function(_$AmateureRadioBandInfoBandAndFrequencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? band = null,
    Object? frequency = null,
  }) {
    return _then(_$AmateureRadioBandInfoBandAndFrequencyImpl(
      band: null == band
          ? _value.band
          : band // ignore: cast_nullable_to_non_nullable
              as AmateurRadioBand,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AmateureRadioBandInfoBandAndFrequencyImpl
    implements _AmateureRadioBandInfoBandAndFrequency {
  const _$AmateureRadioBandInfoBandAndFrequencyImpl(
      {required this.band, required this.frequency, final String? $type})
      : $type = $type ?? 'bandAndFrequency';

  factory _$AmateureRadioBandInfoBandAndFrequencyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AmateureRadioBandInfoBandAndFrequencyImplFromJson(json);

  @override
  final AmateurRadioBand band;
  @override
  final double frequency;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AmateurRadioBandInfo.bandAndFrequency(band: $band, frequency: $frequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmateureRadioBandInfoBandAndFrequencyImpl &&
            (identical(other.band, band) || other.band == band) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, band, frequency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmateureRadioBandInfoBandAndFrequencyImplCopyWith<
          _$AmateureRadioBandInfoBandAndFrequencyImpl>
      get copyWith => __$$AmateureRadioBandInfoBandAndFrequencyImplCopyWithImpl<
          _$AmateureRadioBandInfoBandAndFrequencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AmateurRadioBand band) band,
    required TResult Function(double frequency) frequency,
    required TResult Function(AmateurRadioBand band, double frequency)
        bandAndFrequency,
  }) {
    return bandAndFrequency(this.band, this.frequency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AmateurRadioBand band)? band,
    TResult? Function(double frequency)? frequency,
    TResult? Function(AmateurRadioBand band, double frequency)?
        bandAndFrequency,
  }) {
    return bandAndFrequency?.call(this.band, this.frequency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AmateurRadioBand band)? band,
    TResult Function(double frequency)? frequency,
    TResult Function(AmateurRadioBand band, double frequency)? bandAndFrequency,
    required TResult orElse(),
  }) {
    if (bandAndFrequency != null) {
      return bandAndFrequency(this.band, this.frequency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmateurRadioBandInfoBand value) band,
    required TResult Function(_AmateureRadioBandInfoFrequency value) frequency,
    required TResult Function(_AmateureRadioBandInfoBandAndFrequency value)
        bandAndFrequency,
  }) {
    return bandAndFrequency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmateurRadioBandInfoBand value)? band,
    TResult? Function(_AmateureRadioBandInfoFrequency value)? frequency,
    TResult? Function(_AmateureRadioBandInfoBandAndFrequency value)?
        bandAndFrequency,
  }) {
    return bandAndFrequency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmateurRadioBandInfoBand value)? band,
    TResult Function(_AmateureRadioBandInfoFrequency value)? frequency,
    TResult Function(_AmateureRadioBandInfoBandAndFrequency value)?
        bandAndFrequency,
    required TResult orElse(),
  }) {
    if (bandAndFrequency != null) {
      return bandAndFrequency(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AmateureRadioBandInfoBandAndFrequencyImplToJson(
      this,
    );
  }
}

abstract class _AmateureRadioBandInfoBandAndFrequency
    implements AmateurRadioBandInfo {
  const factory _AmateureRadioBandInfoBandAndFrequency(
          {required final AmateurRadioBand band,
          required final double frequency}) =
      _$AmateureRadioBandInfoBandAndFrequencyImpl;

  factory _AmateureRadioBandInfoBandAndFrequency.fromJson(
          Map<String, dynamic> json) =
      _$AmateureRadioBandInfoBandAndFrequencyImpl.fromJson;

  AmateurRadioBand get band;
  double get frequency;
  @JsonKey(ignore: true)
  _$$AmateureRadioBandInfoBandAndFrequencyImplCopyWith<
          _$AmateureRadioBandInfoBandAndFrequencyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
