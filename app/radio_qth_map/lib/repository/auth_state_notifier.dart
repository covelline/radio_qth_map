import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthStateNotifier extends ChangeNotifier {
  final FirebaseAuth auth;

  AuthStateNotifier({required this.auth}) {
    auth.authStateChanges().listen((_) {
      notifyListeners();
    });
  }
}
