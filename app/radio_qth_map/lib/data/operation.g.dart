// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperationImpl _$$OperationImplFromJson(Map<String, dynamic> json) =>
    _$OperationImpl(
      id: json['id'] as String?,
      callsign: json['callsign'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      startTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['startTime'], const DateTimeConverter().fromJson),
      endTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endTime'], const DateTimeConverter().fromJson),
      dateTime:
          const DateTimeConverter().fromJson(json['dateTime'] as Timestamp),
    );

Map<String, dynamic> _$$OperationImplToJson(_$OperationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'callsign': instance.callsign,
      'location': instance.location,
      'startTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.startTime, const DateTimeConverter().toJson),
      'endTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endTime, const DateTimeConverter().toJson),
      'dateTime': const DateTimeConverter().toJson(instance.dateTime),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
