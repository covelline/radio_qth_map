// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:radio_qth_map/data/amateur_radio_mode.dart';
import 'package:radio_qth_map/data/free_license_radio_mode.dart';

part 'operation_info.freezed.dart';
part 'operation_info.g.dart';

@freezed
sealed class OperationInfo with _$OperationInfo {
  @JsonSerializable(explicitToJson: true)

  /// アマチュア無線の運用情報
  const factory OperationInfo.amateur({
    /// firestoreのID
    String? id,

    /// 運用モード
    AmateurRadioMode? mode,

    /// 運用バンド
    required AmateurRadioBandInfo band,
    double? powerOutput, // 送信出力
  }) = AmateurRadioOperationInfo;

  // フリーライセンスラジオ用
  const factory OperationInfo.freeLicense({
    /// firestoreのID
    String? id,

    /// モード
    required FreeLicenseRadioMode mode,

    /// チャンネル
    int? channel,
  }) = FreeLicenseRadioOperationInfo;

  factory OperationInfo.fromJson(
    String id,
    Map<String, dynamic> json,
  ) =>
      _$OperationInfoFromJson(json).copyWith(
        id: id,
      );
}

extension OperationInfoExtension on OperationInfo {
  /// 説明用テキスト
  String localizedDescription(BuildContext context) {
    switch (this) {
      case AmateurRadioOperationInfo(
          id: _,
          mode: final mode,
          band: final band,
          powerOutput: final powerOutput,
        ):
        return 'Mode: ${mode?.name ?? 'Unknown'}, Band: ${band.description}, Power: ${powerOutput ?? 'Unknown'} W';
      case FreeLicenseRadioOperationInfo(
          id: _,
          mode: final mode,
        ):
        return 'Mode: ${mode.localizedDescription(context)}';
    }
  }
}
