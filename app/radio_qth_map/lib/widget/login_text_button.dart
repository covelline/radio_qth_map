import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/repository/auth_state_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthStateNotifier>();
    final firebaseAuth = authState.auth;
    if (firebaseAuth.currentUser == null) {
      return TextButton(
        onPressed: () {
          context.go('/login');
        },
        child: Text(AppLocalizations.of(context)!.login_signup),
      );
    } else {
      return TextButton(
          onPressed: () {
            firebaseAuth.signOut();
          },
          child: Text(AppLocalizations.of(context)!.logout));
    }
  }
}
