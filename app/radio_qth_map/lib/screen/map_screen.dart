import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:radio_qth_map/screen/add_operation_screen.dart';
import 'package:responsive_framework/max_width_box.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
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
                decoration: InputDecoration(hintText: 'Call Sign'),
                // Implement onChange or controller
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Start Time'),
                // Implement onChange or controller
              ),
              TextField(
                decoration: InputDecoration(hintText: 'End Time'),
                // Implement onChange or controller
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Band'),
                // Implement onChange or controller
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Mode'),
                // Implement onChange or controller
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Search'),
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
      body: const GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 2,
        ),
        // Add other Google Map properties
      ),
    );
  }
}
