import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:radio_qth_map/data/amateur_radio_mode.dart';
import 'package:radio_qth_map/data/free_license_radio_mode.dart';

part 'operation_info.freezed.dart';
part 'operation_info.g.dart';

@freezed
class OperationInfo with _$OperationInfo {
  /// アマチュア無線の運用情報
  const factory OperationInfo.amateur({
    /// firestoreのID
    String? id,

    /// 運用モード
    required AmateurRadioMode mode,

    /// 運用バンド
    required AmateurRadioBandInfo band,
    required double powerOutput, // 送信出力
  }) = AmateurRadioOperationInfo;

  // フリーライセンスラジオ用
  const factory OperationInfo.freeLicense({
    /// firestoreのID
    String? id,

    /// モード
    required FreeLicenseRadioMode mode,
  }) = FreeLicenseRadioOperationInfo;

  factory OperationInfo.fromJson(
    String id,
    Map<String, dynamic> json,
  ) =>
      _$OperationInfoFromJson(json).copyWith(
        id: id,
      );
}
