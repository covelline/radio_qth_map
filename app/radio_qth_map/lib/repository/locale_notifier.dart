import 'package:flutter/material.dart';

class LocaleNotifier extends ChangeNotifier {
  LocaleNotifier(this._locale);

  Locale _locale;

  Locale get locale => _locale;

  void changeLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
