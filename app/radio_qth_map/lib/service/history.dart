// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void pushHistory(String path) {
  html.window.history.pushState(null, '', path);
}
