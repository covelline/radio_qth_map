// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qso.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Qso _$QsoFromJson(Map<String, dynamic> json) {
  return _Qso.fromJson(json);
}

/// @nodoc
mixin _$Qso {
  /// firestoreのID
  String? get id => throw _privateConstructorUsedError;

  /// 相手局コールサイン
  String? get callSign => throw _privateConstructorUsedError;

  /// 相手局ロケーション
  Location get location => throw _privateConstructorUsedError;

  /// 交信時間
  @DateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;

  /// 交信開始時間
  @DateTimeConverter()
  DateTime? get startTime => throw _privateConstructorUsedError;

  /// 更新終了時間
  @DateTimeConverter()
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// 受信したレポート
  String? get rstRcvd => throw _privateConstructorUsedError;

  /// 送信したレポート
  String? get rstSend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QsoCopyWith<Qso> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QsoCopyWith<$Res> {
  factory $QsoCopyWith(Qso value, $Res Function(Qso) then) =
      _$QsoCopyWithImpl<$Res, Qso>;
  @useResult
  $Res call(
      {String? id,
      String? callSign,
      Location location,
      @DateTimeConverter() DateTime date,
      @DateTimeConverter() DateTime? startTime,
      @DateTimeConverter() DateTime? endTime,
      String? rstRcvd,
      String? rstSend});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$QsoCopyWithImpl<$Res, $Val extends Qso> implements $QsoCopyWith<$Res> {
  _$QsoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? callSign = freezed,
    Object? location = null,
    Object? date = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? rstRcvd = freezed,
    Object? rstSend = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      callSign: freezed == callSign
          ? _value.callSign
          : callSign // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rstRcvd: freezed == rstRcvd
          ? _value.rstRcvd
          : rstRcvd // ignore: cast_nullable_to_non_nullable
              as String?,
      rstSend: freezed == rstSend
          ? _value.rstSend
          : rstSend // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QsoImplCopyWith<$Res> implements $QsoCopyWith<$Res> {
  factory _$$QsoImplCopyWith(_$QsoImpl value, $Res Function(_$QsoImpl) then) =
      __$$QsoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? callSign,
      Location location,
      @DateTimeConverter() DateTime date,
      @DateTimeConverter() DateTime? startTime,
      @DateTimeConverter() DateTime? endTime,
      String? rstRcvd,
      String? rstSend});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$QsoImplCopyWithImpl<$Res> extends _$QsoCopyWithImpl<$Res, _$QsoImpl>
    implements _$$QsoImplCopyWith<$Res> {
  __$$QsoImplCopyWithImpl(_$QsoImpl _value, $Res Function(_$QsoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? callSign = freezed,
    Object? location = null,
    Object? date = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? rstRcvd = freezed,
    Object? rstSend = freezed,
  }) {
    return _then(_$QsoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      callSign: freezed == callSign
          ? _value.callSign
          : callSign // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rstRcvd: freezed == rstRcvd
          ? _value.rstRcvd
          : rstRcvd // ignore: cast_nullable_to_non_nullable
              as String?,
      rstSend: freezed == rstSend
          ? _value.rstSend
          : rstSend // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QsoImpl implements _Qso {
  const _$QsoImpl(
      {this.id,
      this.callSign,
      required this.location,
      @DateTimeConverter() required this.date,
      @DateTimeConverter() this.startTime,
      @DateTimeConverter() this.endTime,
      this.rstRcvd,
      this.rstSend});

  factory _$QsoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QsoImplFromJson(json);

  /// firestoreのID
  @override
  final String? id;

  /// 相手局コールサイン
  @override
  final String? callSign;

  /// 相手局ロケーション
  @override
  final Location location;

  /// 交信時間
  @override
  @DateTimeConverter()
  final DateTime date;

  /// 交信開始時間
  @override
  @DateTimeConverter()
  final DateTime? startTime;

  /// 更新終了時間
  @override
  @DateTimeConverter()
  final DateTime? endTime;

  /// 受信したレポート
  @override
  final String? rstRcvd;

  /// 送信したレポート
  @override
  final String? rstSend;

  @override
  String toString() {
    return 'Qso(id: $id, callSign: $callSign, location: $location, date: $date, startTime: $startTime, endTime: $endTime, rstRcvd: $rstRcvd, rstSend: $rstSend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QsoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callSign, callSign) ||
                other.callSign == callSign) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.rstRcvd, rstRcvd) || other.rstRcvd == rstRcvd) &&
            (identical(other.rstSend, rstSend) || other.rstSend == rstSend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, callSign, location, date,
      startTime, endTime, rstRcvd, rstSend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QsoImplCopyWith<_$QsoImpl> get copyWith =>
      __$$QsoImplCopyWithImpl<_$QsoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QsoImplToJson(
      this,
    );
  }
}

abstract class _Qso implements Qso {
  const factory _Qso(
      {final String? id,
      final String? callSign,
      required final Location location,
      @DateTimeConverter() required final DateTime date,
      @DateTimeConverter() final DateTime? startTime,
      @DateTimeConverter() final DateTime? endTime,
      final String? rstRcvd,
      final String? rstSend}) = _$QsoImpl;

  factory _Qso.fromJson(Map<String, dynamic> json) = _$QsoImpl.fromJson;

  @override

  /// firestoreのID
  String? get id;
  @override

  /// 相手局コールサイン
  String? get callSign;
  @override

  /// 相手局ロケーション
  Location get location;
  @override

  /// 交信時間
  @DateTimeConverter()
  DateTime get date;
  @override

  /// 交信開始時間
  @DateTimeConverter()
  DateTime? get startTime;
  @override

  /// 更新終了時間
  @DateTimeConverter()
  DateTime? get endTime;
  @override

  /// 受信したレポート
  String? get rstRcvd;
  @override

  /// 送信したレポート
  String? get rstSend;
  @override
  @JsonKey(ignore: true)
  _$$QsoImplCopyWith<_$QsoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
