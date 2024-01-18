import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum FreeLicenseRadioMode {
  /// 特小
  personalUse,

  /// デジタル省電力コミュニティ無線局
  lcr,

  /// デジタル簡易無線
  dcr,

  /// 市民ラジオ
  citizensBand,
}

extension FreeLicenseRadioModeExtension on FreeLicenseRadioMode {
  String localizedDescription(BuildContext context) {
    switch (this) {
      case FreeLicenseRadioMode.personalUse:
        return AppLocalizations.of(context)!.personal_use;
      case FreeLicenseRadioMode.lcr:
        return AppLocalizations.of(context)!.lcr;
      case FreeLicenseRadioMode.dcr:
        return AppLocalizations.of(context)!.dcr;
      case FreeLicenseRadioMode.citizensBand:
        return AppLocalizations.of(context)!.citizens_band;
    }
  }
}

extension FreeLicenseRadioModeMapPinColor on FreeLicenseRadioMode {
  /// マップに表示するピンの色
  Color get pinColor {
    switch (this) {
      case FreeLicenseRadioMode.personalUse:
        return Colors.blue;
      case FreeLicenseRadioMode.lcr:
        return Colors.green;
      case FreeLicenseRadioMode.dcr:
        return Colors.orange;
      case FreeLicenseRadioMode.citizensBand:
        return Colors.red;
    }
  }
}
