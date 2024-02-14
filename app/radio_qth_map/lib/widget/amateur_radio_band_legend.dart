import 'package:flutter/material.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AmateurRadioBandLegend extends StatefulWidget {
  const AmateurRadioBandLegend({
    super.key,
  });

  @override
  State<AmateurRadioBandLegend> createState() => _AmateurRadioBandLegendState();
}

class _AmateurRadioBandLegendState extends State<AmateurRadioBandLegend> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      constraints: BoxConstraints(
        maxWidth: 200,
        maxHeight: expanded ? double.infinity : 200,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: expanded ? null : 100,
            child: ListView(
              shrinkWrap: expanded,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.location_pin,
                    size: 30,
                    color: Colors.red,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.operation,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ...[
                  AmateurRadioBand.Band160m,
                  AmateurRadioBand.Band80m,
                  AmateurRadioBand.Band60m,
                  AmateurRadioBand.Band40m,
                  AmateurRadioBand.Band30m,
                  AmateurRadioBand.Band20m,
                  AmateurRadioBand.Band17m,
                  AmateurRadioBand.Band15m,
                  AmateurRadioBand.Band12m,
                  AmateurRadioBand.Band10m,
                  AmateurRadioBand.Band8m,
                  AmateurRadioBand.Band6m,
                  AmateurRadioBand.Band5m,
                  AmateurRadioBand.Band4m,
                  AmateurRadioBand.Band2m,
                  AmateurRadioBand.Band1_25m,
                  AmateurRadioBand.Band70cm,
                  AmateurRadioBand.Band23cm,
                ].map(
                  (e) => ListTile(
                    leading: Icon(
                      Icons.location_pin,
                      size: 15,
                      color: e.pinColor,
                    ),
                    title: Text(
                      e.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_pin,
                    size: 15,
                    color: AmateurRadioBand.submm.pinColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.others,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Text(
              expanded
                  ? AppLocalizations.of(context)!.shrink
                  : AppLocalizations.of(context)!.show_all,
            ),
          )
        ],
      ),
    );
  }
}
