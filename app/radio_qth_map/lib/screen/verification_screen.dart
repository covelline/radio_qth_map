import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/repository/auth_state_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({
    super.key,
    required this.child,
    required this.emailLink,
  });
  final Widget child;
  final String emailLink;

  @override
  State createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void didChangeDependencies() async {
    final authState = context.read<AuthStateNotifier>();
    if (authState.auth.currentUser != null) {
      return;
    }
    final user = await authState.signinInWithEmailLink(widget.emailLink);
    if (user != null) {
      if (mounted) {
        final snackbar = SnackBar(
          content: Text(AppLocalizations.of(context)!.login_success),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    } else {
      if (mounted) {
        final snackbar = SnackBar(
          content: Text(AppLocalizations.of(context)!.login_failure),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
