import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

/// 運用地点を表すオブジェクト
@freezed
class Location with _$Location {
  /// 緯度経度持つデータ
  const factory Location.latLng({
    required double latitude,
    required double longitude,
  }) = _LocationLatLng;

  /// グリッドロケーターのみを持つデータ
  const factory Location.gridLocator({
    required String gridLocator,
  }) = _LocationGridLocator;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
