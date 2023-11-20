import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:radio_qth_map/data/amateur_radio_mode.dart';

part 'operation_row.freezed.dart';

@freezed
class OperationRowData with _$OperationRowData {
  @Assert(
      'myGridlocator != null || (myLatitude != null && myLongitude != null)',
      'Gridlocator or lat/lng is required')
  @Assert('frequency != null || band != null', 'Frequency or band is required')
  @Assert(
      'otherGridlocator != null || (otherLatitude != null && otherLongitude != null)',
      'Gridlocator or lat/lng is required')
  @Assert('startTime != null || endTime != null',
      'Start time or end time is required')
  const factory OperationRowData({
    required String myCallsign,
    String? myGridlocator,
    double? myLatitude,
    double? myLongitude,
    double? frequency,
    AmateurRadioBand? band,
    AmateurRadioMode? mode,
    String? otherCallsign,
    String? otherGridlocator,
    double? otherLatitude,
    double? otherLongitude,
    DateTime? startTime,
    DateTime? endTime,
    int? srst,
    int? rrst,
  }) = _OperationRowData;
}

class OperationRow extends StatelessWidget {
  const OperationRow({
    Key? key,
    required this.data,
    this.onTapDelete,
  }) : super(key: key);

  final OperationRowData data;
  final VoidCallback? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Text('${data.startTime?.toString() ?? data.endTime?.toString()}'),
      title: Text(data.otherGridlocator ??
          '${data.otherLatitude.toString()}, ${data.otherLongitude.toString()}'),
      subtitle: Text(data.otherCallsign ?? ''),
      trailing: Text(
        data.frequency?.toString() ?? data.band.toString(),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete'),
              content: const Text('Are you sure you want to delete?'),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Delete'),
                  onPressed: () {
                    onTapDelete?.call();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
