import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:radio_qth_map/data/location.dart';
import 'package:radio_qth_map/data/operation.dart';
import 'package:radio_qth_map/data/operation_info.dart';
import 'package:radio_qth_map/data/qso.dart';
import 'package:radio_qth_map/widget/operation_row.dart';

@immutable
class FirestoreRepository extends InheritedWidget {
  const FirestoreRepository({
    Key? key,
    required this.firestore,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );
  final FirebaseFirestore firestore;

  static FirestoreRepository of(BuildContext context) {
    final FirestoreRepository? result =
        context.dependOnInheritedWidgetOfExactType<FirestoreRepository>();
    assert(result != null, 'No FirestoreRepository found in context');
    return result!;
  }

  Future<void> storeOperations(List<OperationRowData> operations) async {
    // 運用開始・終了時間のリストを作る
    final operationTimes = operations
        .map((e) => [e.startTime, e.endTime])
        .expand((element) => element)
        .whereType<DateTime>()
        .toList()
      ..sort((a, b) => a.compareTo(b));
    final startTime = operationTimes.firstOrNull;
    final endTime = operationTimes.lastOrNull;
    assert(startTime != null || endTime != null);
    final callsign = operations.first.myCallsign;
    final location = operations.first.myLatitude != null &&
            operations.first.myLongitude != null
        ? Location.latLng(
            latitude: operations.first.myLatitude!,
            longitude: operations.first.myLongitude!,
          )
        : Location.gridLocator(
            gridLocator: operations.first.myGridlocator!,
          );
    final operation = Operation(
      callsign: callsign,
      location: location,
      dateTime: startTime ?? endTime!,
      startTime: startTime,
      endTime: endTime,
    );
    // OperationInfoをキーに、Qsoのリストを値に取るMapを作る
    final qsoMap = operations.fold<Map<OperationInfo, List<Qso>>>(
      {},
      (previousValue, element) {
        // element.bandとelement.frequencyが両方あるならAmateurRadioBandInfo.bandAndFrequencyを使い、片方がnullならbandまたはfrequencyを使う
        final AmateurRadioBandInfo band;
        if (element.band != null && element.frequency != null) {
          band = AmateurRadioBandInfo.bandAndFrequency(
              band: element.band!, frequency: element.frequency!);
        } else if (element.band != null) {
          band = AmateurRadioBandInfo.band(band: element.band!);
        } else if (element.frequency != null) {
          band = AmateurRadioBandInfo.frequency(frequency: element.frequency!);
        } else {
          throw ArgumentError('Frequency or band is required');
        }
        final operationInfo = OperationInfo.amateur(
          mode: element.mode,
          band: band,
          powerOutput: element.power,
        );
        final qso = Qso(
          callSign: element.otherCallsign,
          location:
              element.otherLatitude != null && element.otherLongitude != null
                  ? Location.latLng(
                      latitude: element.otherLatitude!,
                      longitude: element.otherLongitude!,
                    )
                  : Location.gridLocator(
                      gridLocator: element.otherGridlocator!,
                    ),
          date: element.startTime ?? element.endTime!,
          startTime: element.startTime,
          endTime: element.endTime,
          rstRcvd: element.rrst?.toString(),
          rstSend: element.srst?.toString(),
        );
        return {
          ...previousValue,
          operationInfo: [...(previousValue[operationInfo] ?? []), qso],
        };
      },
    );
    final batch = firestore.batch();
    final newOperationDoc = firestore.collection('operation').doc();
    batch.set(
      newOperationDoc,
      operation.toJson(),
    );
    for (var element in qsoMap.entries) {
      final newDoc = newOperationDoc.collection('info').doc();
      batch.set(
        newDoc,
        element.key.toJson(),
      );
      for (var qso in element.value) {
        final newQsoDoc = newDoc.collection('qso').doc();
        batch.set(
          newQsoDoc,
          qso.toJson(),
        );
      }
    }
    await batch.commit();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
