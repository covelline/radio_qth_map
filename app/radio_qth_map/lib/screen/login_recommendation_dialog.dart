import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginRecommendationDialog extends StatelessWidget {
  const LoginRecommendationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.login_recommend_dialog_title),
      content:
          Text(AppLocalizations.of(context)!.login_recommend_dialog_message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(AppLocalizations.of(context)!
              .login_recommend_dialog_action_negative),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
              AppLocalizations.of(context)!.login_recommend_dialog_action_yes),
        )
      ],
    );
  }
}
