// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amateur_radio_band.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AmateurRadioBandInfoBandImpl _$$AmateurRadioBandInfoBandImplFromJson(
        Map<String, dynamic> json) =>
    _$AmateurRadioBandInfoBandImpl(
      band: $enumDecode(_$AmateurRadioBandEnumMap, json['band']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AmateurRadioBandInfoBandImplToJson(
        _$AmateurRadioBandInfoBandImpl instance) =>
    <String, dynamic>{
      'band': _$AmateurRadioBandEnumMap[instance.band]!,
      'runtimeType': instance.$type,
    };

const _$AmateurRadioBandEnumMap = {
  AmateurRadioBand.Band2190m: 'Band2190m',
  AmateurRadioBand.Band630m: 'Band630m',
  AmateurRadioBand.Band560m: 'Band560m',
  AmateurRadioBand.Band160m: 'Band160m',
  AmateurRadioBand.Band80m: 'Band80m',
  AmateurRadioBand.Band60m: 'Band60m',
  AmateurRadioBand.Band40m: 'Band40m',
  AmateurRadioBand.Band30m: 'Band30m',
  AmateurRadioBand.Band20m: 'Band20m',
  AmateurRadioBand.Band17m: 'Band17m',
  AmateurRadioBand.Band15m: 'Band15m',
  AmateurRadioBand.Band12m: 'Band12m',
  AmateurRadioBand.Band10m: 'Band10m',
  AmateurRadioBand.Band8m: 'Band8m',
  AmateurRadioBand.Band6m: 'Band6m',
  AmateurRadioBand.Band5m: 'Band5m',
  AmateurRadioBand.Band4m: 'Band4m',
  AmateurRadioBand.Band2m: 'Band2m',
  AmateurRadioBand.Band1_25m: 'Band1_25m',
  AmateurRadioBand.Band70cm: 'Band70cm',
  AmateurRadioBand.Band33cm: 'Band33cm',
  AmateurRadioBand.Band23cm: 'Band23cm',
  AmateurRadioBand.Band13cm: 'Band13cm',
  AmateurRadioBand.Band9cm: 'Band9cm',
  AmateurRadioBand.Band6cm: 'Band6cm',
  AmateurRadioBand.Band3cm: 'Band3cm',
  AmateurRadioBand.Band1_25cm: 'Band1_25cm',
  AmateurRadioBand.Band6mm: 'Band6mm',
  AmateurRadioBand.Band4mm: 'Band4mm',
  AmateurRadioBand.Band2_5mm: 'Band2_5mm',
  AmateurRadioBand.Band2mm: 'Band2mm',
  AmateurRadioBand.Band1mm: 'Band1mm',
  AmateurRadioBand.submm: 'submm',
};

_$AmateureRadioBandInfoFrequencyImpl
    _$$AmateureRadioBandInfoFrequencyImplFromJson(Map<String, dynamic> json) =>
        _$AmateureRadioBandInfoFrequencyImpl(
          frequency: (json['frequency'] as num).toDouble(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$AmateureRadioBandInfoFrequencyImplToJson(
        _$AmateureRadioBandInfoFrequencyImpl instance) =>
    <String, dynamic>{
      'frequency': instance.frequency,
      'runtimeType': instance.$type,
    };

_$AmateureRadioBandInfoBandAndFrequencyImpl
    _$$AmateureRadioBandInfoBandAndFrequencyImplFromJson(
            Map<String, dynamic> json) =>
        _$AmateureRadioBandInfoBandAndFrequencyImpl(
          band: $enumDecode(_$AmateurRadioBandEnumMap, json['band']),
          frequency: (json['frequency'] as num).toDouble(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$AmateureRadioBandInfoBandAndFrequencyImplToJson(
        _$AmateureRadioBandInfoBandAndFrequencyImpl instance) =>
    <String, dynamic>{
      'band': _$AmateurRadioBandEnumMap[instance.band]!,
      'frequency': instance.frequency,
      'runtimeType': instance.$type,
    };
