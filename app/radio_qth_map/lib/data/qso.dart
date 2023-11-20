// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_qth_map/data/json_converters.dart';
import 'package:radio_qth_map/data/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'qso.freezed.dart';
part 'qso.g.dart';

/// QSOの情報コレクション
@freezed
class Qso with _$Qso {
  @JsonSerializable(explicitToJson: true)
  const factory Qso({
    /// firestoreのID
    String? id,

    /// 相手局コールサイン
    String? callSign,

    /// 相手局ロケーション
    required Location location,

    /// 交信時間
    @DateTimeConverter() required DateTime date,

    /// 交信開始時間
    @DateTimeConverter() DateTime? startTime,

    /// 更新終了時間
    @DateTimeConverter() DateTime? endTime,

    /// 受信したレポート
    String? rstRcvd,

    /// 送信したレポート
    String? rstSend,
  }) = _Qso;

  factory Qso.fromJson(String id, Map<String, dynamic> json) =>
      _$QsoFromJson(json).copyWith(
        id: id,
      );
}
