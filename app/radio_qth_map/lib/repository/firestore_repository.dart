import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:radio_qth_map/data/location.dart';
import 'package:radio_qth_map/data/operation.dart';
import 'package:radio_qth_map/data/operation_info.dart';
import 'package:radio_qth_map/data/qso.dart';
import 'package:radio_qth_map/widget/operation_row.dart';

@immutable
class FirestoreRepository {
  const FirestoreRepository({
    required this.firestore,
  });
  final FirebaseFirestore firestore;

  Stream<List<Operation>> get operations {
    return firestore.collection('operation').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        final operation = Operation.fromJson(doc.id, data);
        return operation;
      }).toList();
    });
  }

  Stream<List<Operation>> findOperation({String? callsign}) {
    if (callsign == null || callsign.isEmpty) {
      return operations;
    }

    // コールサインの前方一致で検索する
    final start = callsign;
    final end = callsign.substring(0, callsign.length - 1) +
        String.fromCharCode(callsign.codeUnitAt(callsign.length - 1) + 1);

    return firestore
        .collection('operation')
        .where('callsign', isGreaterThanOrEqualTo: start)
        .where('callsign', isLessThan: end)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        final operation = Operation.fromJson(doc.id, data);
        return operation;
      }).toList();
    });
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

  Stream<List<QsoWithOperation>> qsoWithOperation({
    required String operationId,
  }) {
    final subscriptions = <StreamSubscription>[];
    final controller = StreamController<List<QsoWithOperation>>(
      onCancel: () {
        for (var subscription in subscriptions) {
          subscription.cancel();
        }
        subscriptions.clear();
      },
    );
    final qsoWithOperations = <QsoWithOperation>[];

    final operationInfoStream = firestore
        .collection('operation/$operationId/info')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        final operationInfo = OperationInfo.fromJson(doc.id, data);
        return operationInfo;
      }).toList();
    });
    subscriptions.add(operationInfoStream.listen((event) {
      for (var operationInfo in event) {
        final subscription = firestore
            .collection('operation/$operationId/info/${operationInfo.id}/qso')
            .snapshots()
            .listen((qsos) {
          final qsoWithOps = qsos.docs.map((doc) {
            final data = doc.data();
            final qso = Qso.fromJson(doc.id, data);
            return QsoWithOperation(
              qso: qso,
              operationInfo: operationInfo,
            );
          }).toList();
          qsoWithOperations.addAll(qsoWithOps);
          controller.add(qsoWithOperations);
        });
        subscriptions.add(subscription);
      }
    }));
    return controller.stream;
  }
}
