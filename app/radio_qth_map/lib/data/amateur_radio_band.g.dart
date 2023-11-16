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
  AmateurRadioBand._2190m: '_2190m',
  AmateurRadioBand._630m: '_630m',
  AmateurRadioBand._560m: '_560m',
  AmateurRadioBand._160m: '_160m',
  AmateurRadioBand._80m: '_80m',
  AmateurRadioBand._60m: '_60m',
  AmateurRadioBand._40m: '_40m',
  AmateurRadioBand._30m: '_30m',
  AmateurRadioBand._20m: '_20m',
  AmateurRadioBand._17m: '_17m',
  AmateurRadioBand._15m: '_15m',
  AmateurRadioBand._12m: '_12m',
  AmateurRadioBand._10m: '_10m',
  AmateurRadioBand._8m: '_8m',
  AmateurRadioBand._6m: '_6m',
  AmateurRadioBand._5m: '_5m',
  AmateurRadioBand._4m: '_4m',
  AmateurRadioBand._2m: '_2m',
  AmateurRadioBand._1_25m: '_1_25m',
  AmateurRadioBand._70cm: '_70cm',
  AmateurRadioBand._33cm: '_33cm',
  AmateurRadioBand._23cm: '_23cm',
  AmateurRadioBand._13cm: '_13cm',
  AmateurRadioBand._9cm: '_9cm',
  AmateurRadioBand._6cm: '_6cm',
  AmateurRadioBand._3cm: '_3cm',
  AmateurRadioBand._1_25cm: '_1_25cm',
  AmateurRadioBand._6mm: '_6mm',
  AmateurRadioBand._4mm: '_4mm',
  AmateurRadioBand._2_5mm: '_2_5mm',
  AmateurRadioBand._2mm: '_2mm',
  AmateurRadioBand._1mm: '_1mm',
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
