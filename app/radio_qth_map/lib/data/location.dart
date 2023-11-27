import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as latlong2;

part 'location.freezed.dart';
part 'location.g.dart';

/// 運用地点を表すオブジェクト
@freezed
sealed class Location with _$Location {
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

extension LocationExtension on Location {
  LatLng get latLng {
    switch (this) {
      case _LocationLatLng(
          latitude: final latitude,
          longitude: final longitude
        ):
        return LatLng(latitude, longitude);
      case _LocationGridLocator(gridLocator: final gridLocator):
        return gridLocatorToLatLng(gridLocator);
    }
  }

  // 2つのLocation間の距離を計算する
  double distanceTo(Location other) {
    final latLng = this.latLng;
    final otherLatLng = other.latLng;
    // 緯度経度から距離を計算する
    const distance = latlong2.Distance();
    return distance.as(
        latlong2.LengthUnit.Kilometer,
        latlong2.LatLng(latLng.latitude, latLng.longitude),
        latlong2.LatLng(otherLatLng.latitude, otherLatLng.longitude));
  }

  // 説明用のテキスト
  String get description {
    switch (this) {
      case _LocationLatLng(
          latitude: final latitude,
          longitude: final longitude
        ):
        return 'latitude: $latitude, longitude: $longitude';
      case _LocationGridLocator(gridLocator: final gridLocator):
        return 'Grid locator: $gridLocator';
    }
  }
}

LatLng gridLocatorToLatLng(String gridLocator) {
  // Validate gridLocator length
  assert(gridLocator.length >= 4);

  // Convert to upper case
  gridLocator = gridLocator.toUpperCase();

  // Extract field and square values
  int lngField = gridLocator.codeUnitAt(0) - 'A'.codeUnitAt(0);
  int latField = gridLocator.codeUnitAt(1) - 'A'.codeUnitAt(0);
  int lngSquare = int.parse(gridLocator[2]);
  int latSquare = int.parse(gridLocator[3]);

  // Calculate the basic longitude and latitude
  double longitude = -180 + lngField * 20 + lngSquare * 2;
  double latitude = -90 + latField * 10 + latSquare * 1;

  // Calculate subsquare if present
  if (gridLocator.length >= 6) {
    int lngSubSquare = gridLocator.codeUnitAt(4) - 'A'.codeUnitAt(0);
    int latSubSquare = gridLocator.codeUnitAt(5) - 'A'.codeUnitAt(0);

    longitude += lngSubSquare * (2 / 24);
    latitude += latSubSquare * (1 / 24);

    // Adjust for center of subsquare
    longitude += (2 / 24) / 2;
    latitude += (1 / 24) / 2;
  } else {
    // Adjust for center of square
    longitude += 1;
    latitude += 0.5;
  }

  return LatLng(latitude, longitude);
}
