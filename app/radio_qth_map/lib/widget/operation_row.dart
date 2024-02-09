import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:radio_qth_map/data/amateur_radio_mode.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:radio_qth_map/data/free_license_radio_mode.dart';

part 'operation_row.freezed.dart';

@freezed
class OperationRowData with _$OperationRowData {
  @Assert(
      'myGridlocator != null || (myLatitude != null && myLongitude != null)',
      'Gridlocator or lat/lng is required')
  @Assert('freeLicenseMode != null || frequency != null || band != null',
      'Frequency or band is required')
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
    AmateurRadioMode? amateurRadioMode,
    FreeLicenseRadioMode? freeLicenseMode,
    int? channel,
    double? power,
    String? otherCallsign,
    String? otherGridlocator,
    double? otherLatitude,
    double? otherLongitude,
    DateTime? startTime,
    DateTime? endTime,
    int? srst,
    int? rrst,
    required bool displayOtherCallsign,
  }) = _OperationRowData;
}

class OperationRow extends StatelessWidget {
  const OperationRow({
    super.key,
    required this.data,
    this.onTapDelete,
  });

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
      trailing: Text(data.freeLicenseMode?.localizedDescription(context) ??
          data.frequency?.toString() ??
          data.band.toString()),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.delete),
              content: Text(AppLocalizations.of(context)!
                  .delete_operation_confirm_message),
              actions: [
                TextButton(
                  child: Text(AppLocalizations.of(context)!.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(AppLocalizations.of(context)!.delete),
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
