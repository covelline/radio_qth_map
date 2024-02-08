import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class ScreenAnalytics extends NavigatorObserver {
  final FirebaseAnalytics _analytics;

  ScreenAnalytics({required FirebaseAnalytics analytics})
      : _analytics = analytics;

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      _analytics.setCurrentScreen(
        screenName: route.settings.name!,
      );
      _analytics.logScreenView(
        screenName: route.settings.name!,
      );
    }
  }
}
