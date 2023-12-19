import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// ライセンス形態
enum LicenseType {
  /// アマチュア無線
  amateurRadio,

  /// フリラー
  free,
}

extension LicenseTypeExtension on LicenseType {
  /// 説明用テキスト
  String localizedDescription(BuildContext context) {
    switch (this) {
      case LicenseType.amateurRadio:
        return AppLocalizations.of(context)!.ham;
      case LicenseType.free:
        return AppLocalizations.of(context)!.free_license;
    }
  }

  /// アイコン
  IconData get icon {
    switch (this) {
      case LicenseType.amateurRadio:
        return Icons.radio;
      case LicenseType.free:
        return Icons.wifi;
    }
  }
}
