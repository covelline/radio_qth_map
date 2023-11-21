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
  Band2190m,
  Band630m,
  Band560m,
  Band160m,
  Band80m,
  Band60m,
  Band40m,
  Band30m,
  Band20m,
  Band17m,
  Band15m,
  Band12m,
  Band10m,
  Band8m,
  Band6m,
  Band5m,
  Band4m,
  Band2m,
  Band1_25m,
  Band70cm,
  Band33cm,
  Band23cm,
  Band13cm,
  Band9cm,
  Band6cm,
  Band3cm,
  Band1_25cm,
  Band6mm,
  Band4mm,
  Band2_5mm,
  Band2mm,
  Band1mm,
  submm,
}
