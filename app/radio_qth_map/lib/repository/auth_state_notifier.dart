import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStateNotifier extends ChangeNotifier {
  final FirebaseAuth auth;
  final FirebaseAnalytics analytics;
  final SharedPreferences prefs;

  AuthStateNotifier({
    required this.auth,
    required this.analytics,
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
      final cred =
          await auth.signInWithEmailLink(email: email, emailLink: emailLink);
      if (cred.additionalUserInfo?.isNewUser == true) {
        analytics.logSignUp(signUpMethod: "emailLink");
      } else {
        analytics.logLogin(loginMethod: "emailLink");
      }
    } catch (e) {
      debugPrint('Failed to sign in with email link: $e');
    } finally {
      prefs.remove('emailForSigninLink');
    }
    return auth.currentUser;
  }
}
