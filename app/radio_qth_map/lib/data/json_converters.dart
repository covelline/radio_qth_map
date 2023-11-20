import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_qth_map/data/location.dart';

class DateTimeConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }
}

class LocationConverter
    implements JsonConverter<Location, Map<String, dynamic>> {
  const LocationConverter();
  @override
  Location fromJson(Map<String, dynamic> json) {
    return Location.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Location object) {
    return object.toJson();
  }
}
