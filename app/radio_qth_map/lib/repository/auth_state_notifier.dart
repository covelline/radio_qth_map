import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStateNotifier extends ChangeNotifier {
  final FirebaseAuth auth;
  final SharedPreferences prefs;

  AuthStateNotifier({
    required this.auth,
    required this.prefs,
  }) {
    auth.authStateChanges().listen((_) {
      notifyListeners();
    });
  }

  Future<User?> signinInWithEmailLink(String emailLink) async {
    final email = prefs.getString('emailForSigninLink');
    if (email == null) {
      return null;
    }
    try {
      await auth.signInWithEmailLink(email: email, emailLink: emailLink);
    } catch (e) {
      debugPrint('Failed to sign in with email link: $e');
    } finally {
      prefs.remove('emailForSigninLink');
    }
    return auth.currentUser;
  }
}
