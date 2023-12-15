import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/data/location.dart';
import 'package:radio_qth_map/data/operation.dart';
import 'package:radio_qth_map/data/operation_info.dart';
import 'package:radio_qth_map/data/qso.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:radio_qth_map/repository/firestore_repository.dart';
import 'package:radio_qth_map/widget/infomation_marker.dart';
import 'package:url_launcher/url_launcher.dart';

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

class OperationMapState extends State<OperationMap>
    with TickerProviderStateMixin {
  late StreamSubscription<List<Operation>> _operationSubscription;
  StreamSubscription<List<QsoWithOperation>>? _qsoWithOperationSubscription;
  final _mapController = MapController();
  late DateFormat _dateFormat;

  Operation? _selectedOperation;
  QsoWithOperation? _selectedQsoWithOperation;

  var _operationMarkers = <Marker>[]; // オペレーションのマーカー
  var _visibleMarkers = <Marker>[]; // 表示するマーカー
  var _distanceLines = <Polyline>[]; // 距離を表示する線

  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dateFormat =
        DateFormat.yMMMMd(AppLocalizations.of(context)!.localeName).add_Hms();
    showOperations();
  }

  void showOperations({String? callsign}) {
    final repository = context.read<FirestoreRepository>();
    _operationSubscription =
        repository.findOperation(callsign: callsign).listen((operations) {
      setState(() {
        _operationMarkers = operations.map((operation) {
          return Marker(
            point: operation.location.latLng,
            child: GestureDetector(
              onTap: () {
                _selectedOperation = operation;
                _showOperationDetail();
                _subscribeQSOs();
                _animatedMapMove(
                  operation.location.latLng,
                  10,
                );
              },
              child: const Icon(
                Icons.location_pin,
                size: 60,
                color: Colors.red,
              ),
            ),
            width: 60,
            height: 60,
          );
        }).toList();
        _visibleMarkers = _operationMarkers;
      });
    });
  }

  void _subscribeQSOs() async {
    assert(_selectedOperation != null);
    final operation = _selectedOperation!;
    _qsoWithOperationSubscription?.cancel();
    final repository = context.read<FirestoreRepository>();
    // 選択したオペレーションのQSOを表示する
    _qsoWithOperationSubscription = repository
        .qsoWithOperation(operationId: operation.id!)
        .listen((qsoWithOperations) {
      // マーカーのコントローラーを保持しておいて、情報ウィンドウを閉じれるようにする
      final infoController = List.generate(
          qsoWithOperations.length, (_) => GlobalKey<InformationMarkerState>());
      setState(() {
        // QSOWithOperationのマーカーと、選択されたOperationのマーカーを表示する
        _visibleMarkers = qsoWithOperations.map((e) {
          final key = ValueKey(e.qso.id);
          final infoControllerKey =
              infoController[qsoWithOperations.indexOf(e)];
          return Marker(
            key: key,
            point: e.qso.location.latLng,
            child: InformationMarker(
              key: infoControllerKey,
              information: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      title: Text(
                          """${e.qso.location.description} ${e.qso.location.distanceTo(operation.location)}km"""),
                      subtitle: Text(e.qso.callSign ?? ""),
                      trailing: IconButton(
                        onPressed: () {
                          infoControllerKey.currentState?.dismissInfomation();
                          setState(() {
                            _selectedQsoWithOperation = null;
                          });
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    ListTile(
                      title: Text(
                          AppLocalizations.of(context)!.operation_date), // 運用日時
                      subtitle: Text(_dateFormat.format(e.qso.date)),
                    ),
                    ListTile(
                      title: Text(e.operationInfo.description),
                    ),
                  ],
                ),
              ),
              markerChild: const Icon(
                Icons.location_pin,
                size: 60,
                color: Colors.blue,
              ),
              onTap: () {
                for (var element in infoController) {
                  element.currentState?.dismissInfomation();
                }
                // 他のマーカーのピンが情報ウインドウに重ならないように、
                // 選択したマーカーを最後に表示する
                setState(() {
                  final selectedIndex = _visibleMarkers
                      .indexWhere((element) => element.key == key);
                  final selectedMarker =
                      _visibleMarkers.removeAt(selectedIndex);
                  _visibleMarkers = _visibleMarkers..add(selectedMarker);
                  _selectedQsoWithOperation = e;
                  _showDistanceLine();
                });
              },
            ),
            width: 256,
            height: 256,
          );
        }).toList()
          ..insert(
            0,
            Marker(
              point: operation.location.latLng,
              child: const Icon(
                Icons.location_pin,
                size: 60,
                color: Colors.red,
              ),
              width: 60,
              height: 60,
            ),
          );
        widget.onOperationSelected();
      });
    });
  }

  void _showOperationDetail() async {
    assert(_selectedOperation != null);
    final operation = _selectedOperation!;
    final sheetController = showBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Scaffold(
              appBar: AppBar(
                title: Text(operation.callsign),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              body: ListView(
                children: [
                  ListTile(
                    title:
                        Text(AppLocalizations.of(context)!.operation_location),
                    subtitle: Text(operation.location.description),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.operation_date),
                    subtitle: Text(_dateFormat.format(operation.dateTime)),
                  ),
                ],
              )),
        );
      },
    );
    await sheetController.closed;
    // ボトムシートが閉じたら、全ての選択状態を解除してオペレーション一覧を表示する
    // ボトムシートの閉じる動作は色々な方法があるので、 `closed` で待つ
    setState(() {
      _visibleMarkers = _operationMarkers;
      _selectedOperation = null;
      _selectedQsoWithOperation = null;
      _distanceLines = [];
    });
  }

  void _showDistanceLine() {
    assert(_selectedOperation != null);
    assert(_selectedQsoWithOperation != null);
    final operation = _selectedOperation!;
    final qsoWithOperation = _selectedQsoWithOperation!;
    setState(() {
      _distanceLines = [
        Polyline(
          points: [
            operation.location.latLng,
            qsoWithOperation.qso.location.latLng,
          ],
          strokeWidth: 2.0,
          color: Colors.red,
        ),
      ];
    });
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final camera = _mapController.camera;
    final latTween = Tween<double>(
        begin: camera.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: camera.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: camera.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    // Note this method of encoding the target destination is a workaround.
    // When proper animated movement is supported (see #1263) we should be able
    // to detect an appropriate animated movement event which contains the
    // target zoom/center.
    final startIdWithTarget =
        '$_startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;

    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = _finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = _inProgressId;
      }

      hasTriggeredMove |= _mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    _operationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: const MapOptions(
        initialCenter: LatLng(0, 0),
        initialZoom: 2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: "com.covelline.radio_qth_map",
          tileProvider: CancellableNetworkTileProvider(),
        ),
        PolylineLayer(
          polylines: _distanceLines,
        ),
        MarkerLayer(
          markers: _visibleMarkers,
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(
                Uri.parse('https://openstreetmap.org/copyright'),
              ),
            ),
          ],
          alignment: AttributionAlignment.bottomLeft,
        )
      ],
    );
  }
}
