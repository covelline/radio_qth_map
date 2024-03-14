import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/data/operation.dart';
import 'package:radio_qth_map/repository/firestore_repository.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ShareOperationDialog extends StatelessWidget {
  const ShareOperationDialog({super.key, required this.operationId});

  final String operationId;

  @override
  Widget build(BuildContext context) {
    final repository = context.read<FirestoreRepository>();
    final dateFormat = DateFormat.yMd(AppLocalizations.of(context)!.localeName);
    final analytics = context.read<FirebaseAnalytics>();
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.share),
      content: FutureBuilder(
          future: repository.findOperation(operationId),
          builder: (context, snap) {
            if (!snap.hasData) {
              return const CircularProgressIndicator();
            }
            final operation = snap.data as Operation;
            final shareText =
                AppLocalizations.of(context)!.share_operation_format(
              operation.callsign,
              dateFormat.format(operation.dateTime.toUtc()),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () {
                    analytics.logShare(
                      contentType: "operation",
                      itemId: operationId,
                      method: "X",
                    );
                    final url = '${Uri.base.origin}/map/${operation.id!}';
                    launchUrlString(
                        'https://twitter.com/intent/tweet?text=${Uri.encodeComponent(shareText)}&hashtags=QTHMap&url=${Uri.encodeComponent(url)}');
                  },
                  icon: SvgPicture.asset(
                    'image/x-twitter.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.share_with_x,
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    analytics.logShare(
                      contentType: "operation",
                      itemId: operationId,
                      method: "clipboard",
                    );
                    final text = """
$shareText
${Uri.base.origin}/map/${operation.id!}
#QTHMap
""";
                    await Clipboard.setData(ClipboardData(text: text));
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .copied_to_clipboard),
                          showCloseIcon: true,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.copy),
                  label: Text(
                    AppLocalizations.of(context)!.copy_to_clipboard,
                  ),
                ),
              ],
            );
          }),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.close),
        ),
      ],
    );
  }
}
