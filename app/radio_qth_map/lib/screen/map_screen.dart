import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/repository/locale_notifier.dart';
import 'package:radio_qth_map/screen/add_operation_screen.dart';
import 'package:radio_qth_map/screen/terms_screen.dart';
import 'package:radio_qth_map/widget/operation_map.dart';
import 'package:responsive_framework/max_width_box.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final _operationMapKey = GlobalKey<OperationMapState>();

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Return the search dialog here
        return AlertDialog(
          title: const Text('Search'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                enabled: false,
                decoration: InputDecoration(hintText: 'Call Sign'),
                // Implement onChange or controller
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(hintText: 'Start Time'),
                // Implement onChange or controller
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(hintText: 'End Time'),
                // Implement onChange or controller
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(hintText: 'Band'),
                // Implement onChange or controller
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(hintText: 'Mode'),
                // Implement onChange or controller
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.search),
              onPressed: () {
                // Implement search logic
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QTH map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchDialog,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MaxWidthBox(
                    maxWidth: 1200,
                    child: TermsScreen(),
                  ),
                ),
              );
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
          TextButton(
            onPressed: () {
              launchUrl(Uri.parse("https://twitter.com/numa_radio"));
            },
            child: SvgPicture.asset(
              'image/x-twitter.svg',
              width: 24,
              height: 24,
            ),
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
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MaxWidthBox(
              maxWidth: 1200,
              child: AddOperationScreen(),
            ),
          ));
        },
        label: Text(AppLocalizations.of(context)!.add_qso),
        icon: const Icon(Icons.add),
      ),
      body: OperationMap(
        key: _operationMapKey,
        onOperationSelected: () {
          setState(() {});
        },
      ),
    );
  }
}
