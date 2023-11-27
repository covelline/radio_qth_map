import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:radio_qth_map/data/location.dart';
import 'package:radio_qth_map/data/operation.dart';
import 'package:radio_qth_map/data/operation_info.dart';
import 'package:radio_qth_map/data/qso.dart';
import 'package:radio_qth_map/repository/firestore_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OperationMap extends StatefulWidget {
  const OperationMap({
    Key? key,
    required this.onOperationSelected,
  }) : super(key: key);

  /// オペレーションが選択された時のコールバック
  final VoidCallback onOperationSelected;

  @override
  OperationMapState createState() => OperationMapState();
}

class OperationMapState extends State<OperationMap> {
  late StreamSubscription<List<Operation>> _operationSubscription;
  StreamSubscription<List<QsoWithOperation>>? _qsoWithOperationSubscription;
  late GoogleMapController _mapController;
  late DateFormat _dateFormat;
  var _operationMarkers = <Marker>{};
  var _visibleMarkers = <Marker>{};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dateFormat =
        DateFormat.yMMMMd(AppLocalizations.of(context)!.localeName).add_Hms();

    final repository = FirestoreRepository.of(context);
    _operationSubscription = repository.operations.listen((operations) {
      setState(() {
        _operationMarkers = operations.map((operation) {
          final markerId = MarkerId(operation.id!);
          return Marker(
            markerId: markerId,
            position: operation.location.latLng,
            infoWindow: InfoWindow(
              title: operation.callsign,
              snippet: """
${operation.location.description}
<br/>
${_dateFormat.format(operation.dateTime)}
""",
            ),
            consumeTapEvents: true,
            onTap: () async {
              _mapController.showMarkerInfoWindow(markerId);
              _mapController.animateCamera(CameraUpdate.newLatLngZoom(
                  operation.location.latLng,
                  max(8, await _mapController.getZoomLevel())));
              _subscribeQSOs(operation);
            },
          );
        }).toSet();
        _visibleMarkers = _operationMarkers;
      });
    });
  }

  void _subscribeQSOs(Operation operation) async {
    _qsoWithOperationSubscription?.cancel();
    final repository = FirestoreRepository.of(context);
    final qsoMapIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'image/marker.png',
    );
    // 選択したオペレーションのQSOを表示する
    _qsoWithOperationSubscription = repository
        .qsoWithOperation(operationId: operation.id!)
        .listen((qsoWithOperations) {
      setState(() {
        _visibleMarkers = qsoWithOperations.map((e) {
          final markerId = MarkerId(e.qso.id!);
          return Marker(
            markerId: markerId,
            position: e.qso.location.latLng,
            infoWindow: InfoWindow(
              title:
                  "${e.qso.callSign} (${e.qso.location.distanceTo(operation.location)} km)",
              snippet: """
${e.qso.location.description}
<br/>
${e.operationInfo.description}
<br />
${_dateFormat.format(e.qso.date)}
""",
            ),
            icon: qsoMapIcon,
          );
        }).toSet()
          ..add(
            // 選択したオペレーションのマーカーも表示する
            _operationMarkers
                .firstWhere(
                    (element) => element.markerId == MarkerId(operation.id!))
                .clone(),
          );
        widget.onOperationSelected();
      });
    });
  }

  /// バックキーが押された時のイベント
  void onBackButtonPressed() {
    setState(() {
      _visibleMarkers = _operationMarkers;
    });
  }

  @override
  void dispose() {
    _operationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      initialCameraPosition: const CameraPosition(
        target: LatLng(0, 0),
        zoom: 2,
      ),
      markers: _visibleMarkers,
      onMapCreated: (controller) {
        _mapController = controller;
      },
    );
  }
}
