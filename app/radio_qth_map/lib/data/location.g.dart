// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationLatLngImpl _$$LocationLatLngImplFromJson(Map<String, dynamic> json) =>
    _$LocationLatLngImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocationLatLngImplToJson(
        _$LocationLatLngImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'runtimeType': instance.$type,
    };

_$LocationGridLocatorImpl _$$LocationGridLocatorImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationGridLocatorImpl(
      gridLocator: json['gridLocator'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocationGridLocatorImplToJson(
        _$LocationGridLocatorImpl instance) =>
    <String, dynamic>{
      'gridLocator': instance.gridLocator,
      'runtimeType': instance.$type,
    };
