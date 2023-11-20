// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_qth_map/data/json_converters.dart';
import 'package:radio_qth_map/data/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'operation.freezed.dart';
part 'operation.g.dart';

/// 無線業務の運用
@freezed
class Operation with _$Operation {
  @JsonSerializable(explicitToJson: true)
  const factory Operation({
    /// firestoreのID
    String? id,

    /// コールサイン
    required String callsign,

    /// 運用地
    required Location location,

    /// 運用開始時間
    @DateTimeConverter() DateTime? startTime,

    /// 運用終了時間
    @DateTimeConverter() DateTime? endTime,

    /// 運用時間
    @DateTimeConverter() required DateTime dateTime,
  }) = _Operation;

  factory Operation.fromJson(
    String id,
    Map<String, dynamic> json,
  ) =>
      _$OperationFromJson(json).copyWith(
        id: id,
      );
}
