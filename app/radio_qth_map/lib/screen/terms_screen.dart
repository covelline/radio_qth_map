import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:radio_qth_map/screen/terms_en.dart';
import 'package:radio_qth_map/screen/terms_ja.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String terms;
    if (Localizations.localeOf(context).languageCode == 'ja') {
      terms = termsJa;
    } else {
      terms = termsEn;
    }
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.terms_of_use),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: MarkdownBody(
              data: terms,
            ),
          ),
        ),
      ),
    );
  }
}
