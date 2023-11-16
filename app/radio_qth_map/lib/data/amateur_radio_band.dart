// ignore_for_file: unused_field, constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amateur_radio_band.freezed.dart';
part 'amateur_radio_band.g.dart';

/// 運用バンド・周波数を表すオブジェクト
@freezed
class AmateurRadioBandInfo with _$AmateurRadioBandInfo {
  /// バンド情報のみ
  const factory AmateurRadioBandInfo.band({
    required AmateurRadioBand band,
  }) = _AmateurRadioBandInfoBand;

  /// 周波数のみ
  const factory AmateurRadioBandInfo.frequency({
    required double frequency,
  }) = _AmateureRadioBandInfoFrequency;

  /// バンド・周波数
  const factory AmateurRadioBandInfo.bandAndFrequency({
    required AmateurRadioBand band,
    required double frequency,
  }) = _AmateureRadioBandInfoBandAndFrequency;

  factory AmateurRadioBandInfo.fromJson(Map<String, dynamic> json) =>
      _$AmateurRadioBandInfoFromJson(json);
}

enum AmateurRadioBand {
  _2190m,
  _630m,
  _560m,
  _160m,
  _80m,
  _60m,
  _40m,
  _30m,
  _20m,
  _17m,
  _15m,
  _12m,
  _10m,
  _8m,
  _6m,
  _5m,
  _4m,
  _2m,
  _1_25m,
  _70cm,
  _33cm,
  _23cm,
  _13cm,
  _9cm,
  _6cm,
  _3cm,
  _1_25cm,
  _6mm,
  _4mm,
  _2_5mm,
  _2mm,
  _1mm,
  submm,
}
