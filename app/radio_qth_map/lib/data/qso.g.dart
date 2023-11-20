// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QsoImpl _$$QsoImplFromJson(Map<String, dynamic> json) => _$QsoImpl(
      id: json['id'] as String?,
      callSign: json['callSign'] as String?,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      date: const DateTimeConverter().fromJson(json['date'] as Timestamp),
      startTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['startTime'], const DateTimeConverter().fromJson),
      endTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endTime'], const DateTimeConverter().fromJson),
      rstRcvd: json['rstRcvd'] as String?,
      rstSend: json['rstSend'] as String?,
    );

Map<String, dynamic> _$$QsoImplToJson(_$QsoImpl instance) => <String, dynamic>{
      'id': instance.id,
      'callSign': instance.callSign,
      'location': instance.location.toJson(),
      'date': const DateTimeConverter().toJson(instance.date),
      'startTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.startTime, const DateTimeConverter().toJson),
      'endTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endTime, const DateTimeConverter().toJson),
      'rstRcvd': instance.rstRcvd,
      'rstSend': instance.rstSend,
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
