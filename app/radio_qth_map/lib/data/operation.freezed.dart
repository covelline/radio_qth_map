// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return _Operation.fromJson(json);
}

/// @nodoc
mixin _$Operation {
  /// firestoreのID
  String? get id => throw _privateConstructorUsedError;

  /// コールサイン
  String get callsign => throw _privateConstructorUsedError;

  /// 運用地
  Location get location => throw _privateConstructorUsedError;

  /// 運用開始時間
  @DateTimeConverter()
  DateTime? get startTime => throw _privateConstructorUsedError;

  /// 運用終了時間
  @DateTimeConverter()
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// 運用時間
  @DateTimeConverter()
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperationCopyWith<Operation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationCopyWith<$Res> {
  factory $OperationCopyWith(Operation value, $Res Function(Operation) then) =
      _$OperationCopyWithImpl<$Res, Operation>;
  @useResult
  $Res call(
      {String? id,
      String callsign,
      Location location,
      @DateTimeConverter() DateTime? startTime,
      @DateTimeConverter() DateTime? endTime,
      @DateTimeConverter() DateTime dateTime});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$OperationCopyWithImpl<$Res, $Val extends Operation>
    implements $OperationCopyWith<$Res> {
  _$OperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? callsign = null,
    Object? location = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      callsign: null == callsign
          ? _value.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$OperationImplCopyWith<$Res>
    implements $OperationCopyWith<$Res> {
  factory _$$OperationImplCopyWith(
          _$OperationImpl value, $Res Function(_$OperationImpl) then) =
      __$$OperationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String callsign,
      Location location,
      @DateTimeConverter() DateTime? startTime,
      @DateTimeConverter() DateTime? endTime,
      @DateTimeConverter() DateTime dateTime});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$OperationImplCopyWithImpl<$Res>
    extends _$OperationCopyWithImpl<$Res, _$OperationImpl>
    implements _$$OperationImplCopyWith<$Res> {
  __$$OperationImplCopyWithImpl(
      _$OperationImpl _value, $Res Function(_$OperationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? callsign = null,
    Object? location = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? dateTime = null,
  }) {
    return _then(_$OperationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      callsign: null == callsign
          ? _value.callsign
          : callsign // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OperationImpl implements _Operation {
  const _$OperationImpl(
      {this.id,
      required this.callsign,
      required this.location,
      @DateTimeConverter() this.startTime,
      @DateTimeConverter() this.endTime,
      @DateTimeConverter() required this.dateTime});

  factory _$OperationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationImplFromJson(json);

  /// firestoreのID
  @override
  final String? id;

  /// コールサイン
  @override
  final String callsign;

  /// 運用地
  @override
  final Location location;

  /// 運用開始時間
  @override
  @DateTimeConverter()
  final DateTime? startTime;

  /// 運用終了時間
  @override
  @DateTimeConverter()
  final DateTime? endTime;

  /// 運用時間
  @override
  @DateTimeConverter()
  final DateTime dateTime;

  @override
  String toString() {
    return 'Operation(id: $id, callsign: $callsign, location: $location, startTime: $startTime, endTime: $endTime, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, callsign, location, startTime, endTime, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationImplCopyWith<_$OperationImpl> get copyWith =>
      __$$OperationImplCopyWithImpl<_$OperationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationImplToJson(
      this,
    );
  }
}

abstract class _Operation implements Operation {
  const factory _Operation(
      {final String? id,
      required final String callsign,
      required final Location location,
      @DateTimeConverter() final DateTime? startTime,
      @DateTimeConverter() final DateTime? endTime,
      @DateTimeConverter() required final DateTime dateTime}) = _$OperationImpl;

  factory _Operation.fromJson(Map<String, dynamic> json) =
      _$OperationImpl.fromJson;

  @override

  /// firestoreのID
  String? get id;
  @override

  /// コールサイン
  String get callsign;
  @override

  /// 運用地
  Location get location;
  @override

  /// 運用開始時間
  @DateTimeConverter()
  DateTime? get startTime;
  @override

  /// 運用終了時間
  @DateTimeConverter()
  DateTime? get endTime;
  @override

  /// 運用時間
  @DateTimeConverter()
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$OperationImplCopyWith<_$OperationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
