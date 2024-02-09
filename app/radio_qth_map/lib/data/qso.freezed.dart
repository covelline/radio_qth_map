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

  /// ログ画面で相手のコールサインを表示するかどうか
  bool get displayCallSign => throw _privateConstructorUsedError;

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
      String? rstSend,
      bool displayCallSign});

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
    Object? displayCallSign = null,
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
      displayCallSign: null == displayCallSign
          ? _value.displayCallSign
          : displayCallSign // ignore: cast_nullable_to_non_nullable
              as bool,
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
      String? rstSend,
      bool displayCallSign});

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
    Object? displayCallSign = null,
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
      displayCallSign: null == displayCallSign
          ? _value.displayCallSign
          : displayCallSign // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QsoImpl implements _Qso {
  const _$QsoImpl(
      {this.id,
      this.callSign,
      required this.location,
      @DateTimeConverter() required this.date,
      @DateTimeConverter() this.startTime,
      @DateTimeConverter() this.endTime,
      this.rstRcvd,
      this.rstSend,
      this.displayCallSign = false});

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

  /// ログ画面で相手のコールサインを表示するかどうか
  @override
  @JsonKey()
  final bool displayCallSign;

  @override
  String toString() {
    return 'Qso(id: $id, callSign: $callSign, location: $location, date: $date, startTime: $startTime, endTime: $endTime, rstRcvd: $rstRcvd, rstSend: $rstSend, displayCallSign: $displayCallSign)';
  }

  @override
  bool operator ==(Object other) {
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
            (identical(other.rstSend, rstSend) || other.rstSend == rstSend) &&
            (identical(other.displayCallSign, displayCallSign) ||
                other.displayCallSign == displayCallSign));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, callSign, location, date,
      startTime, endTime, rstRcvd, rstSend, displayCallSign);

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
      final String? rstSend,
      final bool displayCallSign}) = _$QsoImpl;

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

  /// ログ画面で相手のコールサインを表示するかどうか
  bool get displayCallSign;
  @override
  @JsonKey(ignore: true)
  _$$QsoImplCopyWith<_$QsoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QsoWithOperation {
  Qso get qso => throw _privateConstructorUsedError;
  OperationInfo get operationInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QsoWithOperationCopyWith<QsoWithOperation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QsoWithOperationCopyWith<$Res> {
  factory $QsoWithOperationCopyWith(
          QsoWithOperation value, $Res Function(QsoWithOperation) then) =
      _$QsoWithOperationCopyWithImpl<$Res, QsoWithOperation>;
  @useResult
  $Res call({Qso qso, OperationInfo operationInfo});

  $QsoCopyWith<$Res> get qso;
  $OperationInfoCopyWith<$Res> get operationInfo;
}

/// @nodoc
class _$QsoWithOperationCopyWithImpl<$Res, $Val extends QsoWithOperation>
    implements $QsoWithOperationCopyWith<$Res> {
  _$QsoWithOperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qso = null,
    Object? operationInfo = null,
  }) {
    return _then(_value.copyWith(
      qso: null == qso
          ? _value.qso
          : qso // ignore: cast_nullable_to_non_nullable
              as Qso,
      operationInfo: null == operationInfo
          ? _value.operationInfo
          : operationInfo // ignore: cast_nullable_to_non_nullable
              as OperationInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QsoCopyWith<$Res> get qso {
    return $QsoCopyWith<$Res>(_value.qso, (value) {
      return _then(_value.copyWith(qso: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OperationInfoCopyWith<$Res> get operationInfo {
    return $OperationInfoCopyWith<$Res>(_value.operationInfo, (value) {
      return _then(_value.copyWith(operationInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QsoWithOperationImplCopyWith<$Res>
    implements $QsoWithOperationCopyWith<$Res> {
  factory _$$QsoWithOperationImplCopyWith(_$QsoWithOperationImpl value,
          $Res Function(_$QsoWithOperationImpl) then) =
      __$$QsoWithOperationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Qso qso, OperationInfo operationInfo});

  @override
  $QsoCopyWith<$Res> get qso;
  @override
  $OperationInfoCopyWith<$Res> get operationInfo;
}

/// @nodoc
class __$$QsoWithOperationImplCopyWithImpl<$Res>
    extends _$QsoWithOperationCopyWithImpl<$Res, _$QsoWithOperationImpl>
    implements _$$QsoWithOperationImplCopyWith<$Res> {
  __$$QsoWithOperationImplCopyWithImpl(_$QsoWithOperationImpl _value,
      $Res Function(_$QsoWithOperationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qso = null,
    Object? operationInfo = null,
  }) {
    return _then(_$QsoWithOperationImpl(
      qso: null == qso
          ? _value.qso
          : qso // ignore: cast_nullable_to_non_nullable
              as Qso,
      operationInfo: null == operationInfo
          ? _value.operationInfo
          : operationInfo // ignore: cast_nullable_to_non_nullable
              as OperationInfo,
    ));
  }
}

/// @nodoc

class _$QsoWithOperationImpl implements _QsoWithOperation {
  const _$QsoWithOperationImpl(
      {required this.qso, required this.operationInfo});

  @override
  final Qso qso;
  @override
  final OperationInfo operationInfo;

  @override
  String toString() {
    return 'QsoWithOperation(qso: $qso, operationInfo: $operationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QsoWithOperationImpl &&
            (identical(other.qso, qso) || other.qso == qso) &&
            (identical(other.operationInfo, operationInfo) ||
                other.operationInfo == operationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qso, operationInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QsoWithOperationImplCopyWith<_$QsoWithOperationImpl> get copyWith =>
      __$$QsoWithOperationImplCopyWithImpl<_$QsoWithOperationImpl>(
          this, _$identity);
}

abstract class _QsoWithOperation implements QsoWithOperation {
  const factory _QsoWithOperation(
      {required final Qso qso,
      required final OperationInfo operationInfo}) = _$QsoWithOperationImpl;

  @override
  Qso get qso;
  @override
  OperationInfo get operationInfo;
  @override
  @JsonKey(ignore: true)
  _$$QsoWithOperationImplCopyWith<_$QsoWithOperationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
