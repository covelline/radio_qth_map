import 'package:dart_adif/dart_adif.dart';
import 'package:flutter/material.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:radio_qth_map/data/amateur_radio_mode.dart';
import 'package:radio_qth_map/widget/operation_row.dart';

/// ADIFファイルをパースして、OperationRowDataのリストを返す
/// パースに失敗した情報もエラーとして通知する
class AdifFileParser extends StatefulWidget {
  const AdifFileParser({
    super.key,
    required this.onLoadOperations,
    required this.onErrorOperations,
    required this.child,
  });
  final ValueChanged<List<OperationRowData>> onLoadOperations;
  final ValueChanged<List<String>> onErrorOperations;

  final Widget child;

  @override
  State<StatefulWidget> createState() => AdifFileParserState();
}

class AdifFileParserState extends State<AdifFileParser> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<void> loadAdifFile(
    Stream<List<int>> readStream, {
    required String myCallSign,
    String? myGridlocator,
    double? myLatitude,
    double? myLongitude,
  }) async {
    final record = readStream.transform(const AdifTransformer());
    final (operation, error, _) = await record
        .fold((<OperationRowData>[], <String>[], 0), (previous, record) {
      if (record.isHeader) {
        return previous;
      }
      final call = record['call'];
      final startTime =
          DateTime.tryParse("${record['qso_date']}T${record['time_on']}Z");
      final endTime =
          DateTime.tryParse("${record['qso_date_off']}T${record['time_off']}Z");
      if (startTime == null && endTime == null) {
        final error = previous.$2
          ..add('QSO with $call has no start time or end time');
        return (previous.$1, error, previous.$3 + 1);
      }
      final otherGridlocator = record['gridsquare'] ?? '';
      final otherLatitude = double.tryParse(record['lat'] ?? '');
      final otherLongitude = double.tryParse(record['lon'] ?? '');
      if (otherGridlocator == '' &&
          (otherLatitude == null || otherLongitude == null)) {
        final error = previous.$2..add('QSO with $call has no location');
        return (previous.$1, error, previous.$3 + 1);
      }
      final freqMegahertz = double.tryParse(record['freq'] ?? '');
      final freqKilohertz =
          freqMegahertz != null ? freqMegahertz * 1000.0 : null;
      final band = AmateurRadioBand.fromName(record['band'] ?? '');
      final mode = AmateurRadioMode.fromName(record['mode'] ?? '');
      final power = double.tryParse(record['tx_pwr'] ?? '');
      final srst = int.tryParse(record['rst_sent'] ?? '');
      final rrst = int.tryParse(record['rst_rcvd'] ?? '');
      final operation = OperationRowData(
        myCallsign: myCallSign,
        myGridlocator: myGridlocator,
        myLatitude: myLatitude,
        myLongitude: myLongitude,
        otherCallsign: call,
        otherGridlocator: otherGridlocator,
        otherLatitude: otherLatitude,
        otherLongitude: otherLongitude,
        startTime: startTime,
        endTime: endTime,
        frequency: freqKilohertz,
        band: band,
        amateurRadioMode: mode,
        power: power,
        srst: srst,
        rrst: rrst,
        displayOtherCallsign: true,
      );
      final operations = previous.$1..add(operation);
      return (operations, previous.$2, previous.$3 + 1);
    });
    if (operation.isNotEmpty) {
      widget.onLoadOperations(operation);
    }
    if (error.isNotEmpty) {
      widget.onErrorOperations(error);
    }
  }
}
