import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/repository/locale_notifier.dart';
import 'package:radio_qth_map/service/history.dart';
import 'package:radio_qth_map/widget/amateur_radio_band_legend.dart';
import 'package:radio_qth_map/widget/login_text_button.dart';
import 'package:radio_qth_map/widget/operation_map.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.initialCallsign,
    this.operationId,
  });
  final String? initialCallsign;
  final String? operationId;
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final _operationMapKey = GlobalKey<OperationMapState>();
  final _searchController = TextEditingController();
  String? _currentCallsign;

  void _search() {
    // 大文字小文字を無視するため、大文字に変換する
    final callsign = _searchController.text.toUpperCase();

    if (callsign != _currentCallsign) {
      _operationMapKey.currentState?.showOperations(callsign: callsign);
    }
    setState(() {
      _currentCallsign = callsign;
    });
    _setHistoryToCurrentState();
  }

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialCallsign ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
            child: const Text('QTH map'),
            onPressed: () {
              context.go('/');
            },
          ),
          actions: [
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 280),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBar(
                    controller: _searchController,
                    hintText: AppLocalizations.of(context)!.callsign,
                    trailing: [
                      IconButton(
                        onPressed: () {
                          _search();
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ],
                    onSubmitted: (_) {
                      _search();
                    },
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                showLicensePage(context: context);
              },
              child: Text(AppLocalizations.of(context)!.license),
            ),
            TextButton(
              onPressed: () {
                context.go('/terms');
              },
              child: Text(AppLocalizations.of(context)!.terms_of_use),
            ),
            TextButton(
              onPressed: () {
                launchUrl(
                  Uri.parse(
                      "https://docs.google.com/forms/d/e/1FAIpQLSed4yjxKosyZq_LSV7APdRxKPwTr9DgP8TJD4_JagpwyQk9VA/viewform"),
                );
              },
              child: Text(AppLocalizations.of(context)!.contact_us),
            ),
            DropdownButton<Locale>(
              value: Locale(AppLocalizations.of(context)!.localeName),
              items: const [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('ja'),
                  child: Text('日本語'),
                ),
              ],
              onChanged: (newLocale) {
                if (newLocale != null) {
                  setState(() {
                    context.read<LocaleNotifier>().changeLocale(newLocale);
                  });
                }
              },
            ),
            const LoginTextButton(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final newOperationId = await context.push('/qso/add');
            if (newOperationId != null && context.mounted) {
              context.go('/map/$newOperationId');
            }
          },
          label: Text(AppLocalizations.of(context)!.add_qso),
          icon: const Icon(Icons.add),
        ),
        body: Stack(
          children: [
            OperationMap(
              key: _operationMapKey,
              initialCallsign: widget.initialCallsign,
              initialOperationId: widget.operationId,
              onOperationSelected: (operationId) {
                setState(() {
                  if (operationId != null) {
                    if (kIsWeb) {
                      pushHistory('/map/$operationId');
                    }
                  } else {
                    _setHistoryToCurrentState();
                  }
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: AmateurRadioBandLegend(),
            ),
          ],
        ),
      ),
    );
  }

  void _setHistoryToCurrentState() {
    if (kIsWeb) {
      if (_currentCallsign != null && _currentCallsign!.isNotEmpty) {
        pushHistory('/map?callsign=$_currentCallsign');
      } else {
        pushHistory('/map');
      }
    }
  }
}
