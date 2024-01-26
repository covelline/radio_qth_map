// ignore_for_file: unused_field, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amateur_radio_band.freezed.dart';
part 'amateur_radio_band.g.dart';

/// 運用バンド・周波数を表すオブジェクト
@freezed
sealed class AmateurRadioBandInfo with _$AmateurRadioBandInfo {
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

extension AmateurRadioBandExtension on AmateurRadioBandInfo {
  /// 説明用テキスト
  String get description {
    switch (this) {
      case _AmateurRadioBandInfoBand(band: final band):
        return band.name;
      case _AmateureRadioBandInfoFrequency(frequency: final frequency):
        return '$frequency kHz';
      case _AmateureRadioBandInfoBandAndFrequency(
          band: final band,
          frequency: final frequency
        ):
        return '${band.name} ($frequency kHz)';
    }
  }

  /// マップに表示するピンの色
  Color get pinColor {
    switch (this) {
      case _AmateurRadioBandInfoBand(band: final band):
        return band.pinColor;
      case _AmateureRadioBandInfoFrequency(frequency: final frequency):
        final band = AmateurRadioBand.fromFrequency(frequency);
        if (band == null) {
          return const Color(0xff808080);
        }
        return band.pinColor;
      case _AmateureRadioBandInfoBandAndFrequency(
          band: final band,
          frequency: _
        ):
        return band.pinColor;
    }
  }
}

enum AmateurRadioBand {
  Band2190m(
    lowerFrequency: 135.7,
    upperFrequency: 137.8,
    name: '2190m',
  ),
  Band630m(
    lowerFrequency: 472,
    upperFrequency: 479,
    name: '630m',
  ),
  Band560m(
    lowerFrequency: 501,
    upperFrequency: 504,
    name: '560m',
  ),
  Band160m(
    lowerFrequency: 1800,
    upperFrequency: 2000,
    name: '160m',
  ),
  Band80m(
    lowerFrequency: 3500,
    upperFrequency: 4000,
    name: '80m',
  ),
  Band60m(
    lowerFrequency: 5060,
    upperFrequency: 5450,
    name: '60m',
  ),
  Band40m(
    lowerFrequency: 7000,
    upperFrequency: 7300,
    name: '40m',
  ),
  Band30m(
    lowerFrequency: 10100,
    upperFrequency: 10150,
    name: '30m',
  ),
  Band20m(
    lowerFrequency: 14000,
    upperFrequency: 14350,
    name: '20m',
  ),
  Band17m(
    lowerFrequency: 18068,
    upperFrequency: 18168,
    name: '17m',
  ),
  Band15m(
    lowerFrequency: 21000,
    upperFrequency: 21450,
    name: '15m',
  ),
  Band12m(
    lowerFrequency: 24890,
    upperFrequency: 24990,
    name: '12m',
  ),
  Band10m(
    lowerFrequency: 28000,
    upperFrequency: 29700,
    name: '10m',
  ),
  Band8m(
    lowerFrequency: 40000,
    upperFrequency: 45000,
    name: '8m',
  ),
  Band6m(
    lowerFrequency: 50000,
    upperFrequency: 54000,
    name: '6m',
  ),
  Band5m(
    lowerFrequency: 54000.001,
    upperFrequency: 69900,
    name: '5m',
  ),
  Band4m(
    lowerFrequency: 70000,
    upperFrequency: 71000,
    name: '4m',
  ),
  Band2m(
    lowerFrequency: 144000,
    upperFrequency: 148000,
    name: '2m',
  ),
  Band1_25m(
    lowerFrequency: 222000,
    upperFrequency: 225000,
    name: '1.25m',
  ),
  Band70cm(
    lowerFrequency: 420000,
    upperFrequency: 450000,
    name: '70cm',
  ),
  Band33cm(
    lowerFrequency: 902000,
    upperFrequency: 928000,
    name: '33cm',
  ),
  Band23cm(
    lowerFrequency: 1240000,
    upperFrequency: 1300000,
    name: '23cm',
  ),
  Band13cm(
    lowerFrequency: 2300000,
    upperFrequency: 2450000,
    name: '13cm',
  ),
  Band9cm(
    lowerFrequency: 3300000,
    upperFrequency: 3500000,
    name: '9cm',
  ),
  Band6cm(
    lowerFrequency: 5650000,
    upperFrequency: 5925000,
    name: '6cm',
  ),
  Band3cm(
    lowerFrequency: 10000000,
    upperFrequency: 10500000,
    name: '3cm',
  ),
  Band1_25cm(
    lowerFrequency: 24000000,
    upperFrequency: 24250000,
    name: '1.25cm',
  ),
  Band6mm(
    lowerFrequency: 47000000,
    upperFrequency: 47200000,
    name: '6mm',
  ),
  Band4mm(
    lowerFrequency: 75500000,
    upperFrequency: 81000000,
    name: '4mm',
  ),
  Band2_5mm(
    lowerFrequency: 119980000,
    upperFrequency: 123000000,
    name: '2.5mm',
  ),
  Band2mm(
    lowerFrequency: 134000000,
    upperFrequency: 149000000,
    name: '2mm',
  ),
  Band1mm(
    lowerFrequency: 241000000,
    upperFrequency: 250000000,
    name: '1mm',
  ),
  submm(
    lowerFrequency: 300000000,
    upperFrequency: 7500000000,
    name: 'submm',
  ),
  ;

  const AmateurRadioBand({
    required this.lowerFrequency,
    required this.upperFrequency,
    required this.name,
  });

  /// 下限周波数(kHz)
  final double lowerFrequency;

  /// 上限周波数(kHz)
  final double upperFrequency;
  final String name;

  /// 周波数からBandを取得する
  static AmateurRadioBand? fromFrequency(double frequency) {
    for (var band in AmateurRadioBand.values) {
      if (band.lowerFrequency <= frequency &&
          frequency <= band.upperFrequency) {
        return band;
      }
    }
    return null;
  }

  /// Band nameからBandを取得する
  static AmateurRadioBand? fromName(String name) {
    for (var band in AmateurRadioBand.values) {
      if (band.name == name) {
        return band;
      }
    }
    return null;
  }
}

extension AmateurRadioBandPinColor on AmateurRadioBand {
  /// マップに表示するピンの色
  Color get pinColor {
    switch (this) {
      case AmateurRadioBand.Band40m:
        return const Color(0xff5959ff);
      case AmateurRadioBand.Band160m:
        return const Color(0xff7cfc00);
      case AmateurRadioBand.Band60m:
        return const Color(0xff00008b);
      case AmateurRadioBand.Band80m:
        return const Color(0xffe550e5);
      case AmateurRadioBand.Band10m:
        return const Color(0xffff69b4);
      case AmateurRadioBand.Band20m:
        return const Color(0xfff2c40c);
      case AmateurRadioBand.Band30m:
        return const Color(0xff62d962);
      case AmateurRadioBand.Band15m:
        return const Color(0xffcca166);
      case AmateurRadioBand.Band12m:
        return const Color(0xffb22222);
      case AmateurRadioBand.Band17m:
        return const Color(0xfff2f261);
      case AmateurRadioBand.Band6m:
        return const Color(0xffff0000);
      case AmateurRadioBand.Band2m:
        return const Color(0xffff1493);
      case AmateurRadioBand.Band23cm:
        return const Color(0xff5ab8c7);
      case AmateurRadioBand.Band4m:
        return const Color(0xffcc0044);
      case AmateurRadioBand.Band70cm:
        return const Color(0xff999900);
      case AmateurRadioBand.Band8m:
        return const Color(0xff7f00f1);
      case AmateurRadioBand.Band5m:
        return const Color(0xffe0e0e0);
      case AmateurRadioBand.Band1_25m:
        return const Color(0xffccff00);
      default:
        return const Color(0xff808080);
    }
  }
}
