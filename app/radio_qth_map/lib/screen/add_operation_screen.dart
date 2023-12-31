import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:radio_qth_map/data/amateur_radio_band.dart';
import 'package:radio_qth_map/data/amateur_radio_mode.dart';
import 'package:radio_qth_map/data/free_license_radio_mode.dart';
import 'package:radio_qth_map/data/license_type.dart';
import 'package:radio_qth_map/repository/firestore_repository.dart';
import 'package:radio_qth_map/widget/operation_row.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:radio_qth_map/widget/date_time_ext.dart';

class AddOperationScreen extends StatefulWidget {
  const AddOperationScreen({super.key});

  @override
  State<AddOperationScreen> createState() => _AddOperationScreenState();
}

class _AddOperationScreenState extends State<AddOperationScreen> {
  final _myOperationInfoKey = GlobalKey<_MyOperationInfoInputFormState>();
  final _otherStationInfoKey = GlobalKey<_OtherStationInfoInputFormState>();
  final _licenseTypeSelectionKey =
      GlobalKey<_LicenseTypeSelectionButtonState>();
  final _licenseModeNotifier =
      ValueNotifier<LicenseType>(LicenseType.amateurRadio);
  final _logList = <OperationRowData>[];

  @override
  void initState() {
    super.initState();
    _licenseModeNotifier.addListener(() {
      _myOperationInfoKey.currentState?.reset();
      _otherStationInfoKey.currentState?.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.add_qso),
        actions: [
          _LicenseTypeSelectionButton(
            // 1運用につき1ライセンスタイプとする
            key: _licenseTypeSelectionKey,
            canChangeLicenseMode: _logList.isEmpty,
            licenseTypeNotifier: _licenseModeNotifier,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _logList.isEmpty
            ? null
            : () async {
                final repository = context.read<FirestoreRepository>();
                final id = await repository.storeOperations(_logList);
                if (context.mounted) {
                  context.pop(id);
                }
              },
        label: Text(AppLocalizations.of(context)!.publish_log),
        icon: const Icon(Icons.publish),
        tooltip: AppLocalizations.of(context)!.publish_log_tooltip,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(AppLocalizations.of(context)!.my_statio_settings),
            ),
            SliverToBoxAdapter(
              child: ValueListenableBuilder(
                  valueListenable: _licenseModeNotifier,
                  builder: (context, type, _) {
                    return _MyOperationInfoInputForm(
                      key: _myOperationInfoKey,
                      // 1運用につき1ライセンスタイプとするので、運用情報がある場合はコールサインを変更できないようにする
                      canChangeCallsign: _logList.isEmpty,
                      licenseType: type,
                    );
                  }),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(AppLocalizations.of(context)!.other_station_settings),
            ),
            SliverToBoxAdapter(
              child: ValueListenableBuilder(
                valueListenable: _licenseModeNotifier,
                builder: (context, type, _) {
                  return _OtherStationInfoInputForm(
                    key: _otherStationInfoKey,
                    licenseType: type,
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_myOperationInfoKey.currentState?.validate() == true &&
                      _otherStationInfoKey.currentState?.validate() == true) {
                    final myOperationInfo = _myOperationInfoKey.currentState!;
                    final otherStationInfo = _otherStationInfoKey.currentState!;
                    final operationRowData = OperationRowData(
                      myCallsign: myOperationInfo.callsignController.text,
                      myGridlocator: myOperationInfo.gridlocatorController.text,
                      myLatitude: double.tryParse(
                        myOperationInfo.latitudeController.text,
                      ),
                      myLongitude: double.tryParse(
                        myOperationInfo.longitudeController.text,
                      ),
                      frequency: double.tryParse(
                        myOperationInfo.frequencyController.text,
                      ),
                      band: myOperationInfo.band,
                      amateurRadioMode: myOperationInfo.amateurRadioMode,
                      freeLicenseMode: myOperationInfo.freeLicenseMode,
                      channel: int.tryParse(
                        myOperationInfo.channelController.text,
                      ),
                      power: double.tryParse(
                        myOperationInfo.powerController.text,
                      ),
                      otherCallsign: otherStationInfo.callsignController.text,
                      otherGridlocator:
                          otherStationInfo.gridlocatorController.text,
                      otherLatitude: double.tryParse(
                        otherStationInfo.latitudeController.text,
                      ),
                      otherLongitude: double.tryParse(
                        otherStationInfo.longitudeController.text,
                      ),
                      startTime: DateTimeExtension.tryParseUTC(
                        otherStationInfo.startController.text,
                      ),
                      endTime: DateTimeExtension.tryParseUTC(
                        otherStationInfo.endController.text,
                      ),
                      srst: int.tryParse(
                        otherStationInfo.srstController.text,
                      ),
                      rrst: int.tryParse(
                        otherStationInfo.rrstController.text,
                      ),
                    );
                    setState(() {
                      _logList.add(operationRowData);
                    });
                    otherStationInfo.reset();
                  }
                },
                icon: const Icon(Icons.add),
                label: Text(
                  AppLocalizations.of(context)!.add_qso,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverList.builder(
              itemCount: _logList.length,
              itemBuilder: (context, index) {
                return OperationRow(
                  data: _logList[index],
                  onTapDelete: () {
                    setState(() {
                      _logList.removeAt(index);
                    });
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _MyOperationInfoInputForm extends StatefulWidget {
  const _MyOperationInfoInputForm({
    super.key,
    required this.canChangeCallsign,
    required this.licenseType,
  });
  final bool canChangeCallsign;
  final LicenseType licenseType;

  @override
  State<StatefulWidget> createState() {
    return _MyOperationInfoInputFormState();
  }
}

class _MyOperationInfoInputFormState extends State<_MyOperationInfoInputForm> {
  final formKey = GlobalKey<FormState>();

  final callsignController = TextEditingController();
  final gridlocatorController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final frequencyController = TextEditingController();
  AmateurRadioBand? band;
  AmateurRadioMode? amateurRadioMode;
  final channelController = TextEditingController();
  FreeLicenseRadioMode? freeLicenseMode;
  final powerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ResponsiveRowColumn(
            rowSpacing: 8,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  enabled: widget.canChangeCallsign,
                  controller: callsignController,
                  inputFormatters: [
                    if (widget.licenseType == LicenseType.amateurRadio) ...[
                      TextInputFormatter.withFunction(_uppercaseFormatter)
                    ] else
                      ...[]
                  ],
                  decoration: InputDecoration(
                    labelText: '${AppLocalizations.of(context)!.callsign}*',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.callsign_is_required;
                    }
                    return null;
                  },
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: gridlocatorController,
                  inputFormatters: [
                    TextInputFormatter.withFunction(_uppercaseFormatter)
                  ],
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.gridlocator,
                  ),
                  validator: (value) {
                    final gridLocatorValidated = value?.isNotEmpty ?? false;
                    final latitudeValidated =
                        double.tryParse(latitudeController.text) != null;
                    final longitudeValidated = double.tryParse(
                          longitudeController.text,
                        ) !=
                        null;
                    if (gridLocatorValidated ||
                        (latitudeValidated && longitudeValidated)) {
                      return null;
                    }
                    return AppLocalizations.of(context)!.location_error;
                  },
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: latitudeController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.latitude,
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: longitudeController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.longitude,
                  ),
                ),
              ),
            ],
          ),
          ResponsiveRowColumn(
            rowSpacing: 8,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              if (widget.licenseType == LicenseType.amateurRadio) ...[
                // アマチュア無線向け入力フォーム
                // 周波数・バンド・モード
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        final frequency = double.tryParse(
                              frequencyController.text,
                            ) ??
                            0;
                        final newBand =
                            AmateurRadioBand.fromFrequency(frequency);
                        setState(() {
                          if (newBand != null) {
                            band = newBand;
                          }
                        });
                      }
                    },
                    child: TextFormField(
                      controller: frequencyController,
                      decoration: InputDecoration(
                        labelText:
                            '${AppLocalizations.of(context)!.frequency} kHz',
                      ),
                      validator: (value) {
                        final frequencyValidated =
                            double.tryParse(value ?? '') != null;
                        final bandValidated = band != null;
                        if (frequencyValidated || bandValidated) {
                          return null;
                        }
                        return AppLocalizations.of(context)!.frequency_error;
                      },
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: DropdownButtonFormField(
                    value: band,
                    items: [
                      for (final band in AmateurRadioBand.values)
                        DropdownMenuItem(
                          value: band,
                          child: Text(band.name),
                        )
                    ],
                    hint: Text(
                      AppLocalizations.of(context)!.band,
                    ),
                    onChanged: (value) {
                      setState(() {
                        band = value;
                      });
                    },
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: DropdownButtonFormField(
                    items: [
                      for (final mode in AmateurRadioMode.values)
                        DropdownMenuItem(
                          value: mode,
                          child: Text(mode.name),
                        )
                    ],
                    hint: Text(
                      AppLocalizations.of(context)!.mode,
                    ),
                    onChanged: (value) {
                      setState(() {
                        amateurRadioMode = value;
                      });
                    },
                  ),
                )
              ] else ...[
                // フリラ向け入力フォーム
                // チャンネル・モード
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: channelController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.channel,
                    ),
                    validator: (value) {
                      final channelValidated =
                          int.tryParse(value ?? '') != null;
                      final modeValidated = freeLicenseMode != null;
                      if (channelValidated || modeValidated) {
                        return null;
                      }
                      return AppLocalizations.of(context)!.channel_error;
                    },
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: DropdownButtonFormField(
                    items: [
                      for (final mode in FreeLicenseRadioMode.values)
                        DropdownMenuItem(
                          value: mode,
                          child: Text(mode.localizedDescription(context)),
                        )
                    ],
                    hint: Text(
                      AppLocalizations.of(context)!.mode,
                    ),
                    onChanged: (value) {
                      setState(() {
                        freeLicenseMode = value;
                      });
                    },
                  ),
                ),
              ],
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: powerController,
                  decoration: InputDecoration(
                    labelText: '${AppLocalizations.of(context)!.power} W',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void reset() {
    formKey.currentState?.reset();
  }
}

class _OtherStationInfoInputForm extends StatefulWidget {
  const _OtherStationInfoInputForm({
    super.key,
    required this.licenseType,
  });
  final LicenseType licenseType;
  @override
  State<StatefulWidget> createState() {
    return _OtherStationInfoInputFormState();
  }
}

class _OtherStationInfoInputFormState
    extends State<_OtherStationInfoInputForm> {
  final formKey = GlobalKey<FormState>();

  final callsignController = TextEditingController();
  final gridlocatorController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final rrstController = TextEditingController();
  final srstController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ResponsiveRowColumn(
            rowSpacing: 8,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: callsignController,
                  inputFormatters: [
                    if (widget.licenseType == LicenseType.amateurRadio) ...[
                      TextInputFormatter.withFunction(_uppercaseFormatter)
                    ] else
                      ...[]
                  ],
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.callsign,
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: gridlocatorController,
                  inputFormatters: [
                    TextInputFormatter.withFunction(_uppercaseFormatter)
                  ],
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.gridlocator,
                  ),
                  validator: (value) {
                    final gridLocatorValidated = value?.isNotEmpty ?? false;
                    final latitudeValidated =
                        double.tryParse(latitudeController.text) != null;
                    final longitudeValidated = double.tryParse(
                          longitudeController.text,
                        ) !=
                        null;
                    if (gridLocatorValidated ||
                        (latitudeValidated && longitudeValidated)) {
                      return null;
                    }
                    return AppLocalizations.of(context)!.location_error;
                  },
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: latitudeController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.latitude,
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: longitudeController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.longitude,
                  ),
                ),
              ),
            ],
          ),
          ResponsiveRowColumn(
            rowSpacing: 8,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: startController,
                  decoration: InputDecoration(
                    labelText:
                        '${AppLocalizations.of(context)!.start} GMT (2023-01-23 04:56:00)',
                    hintText: '2023-01-23 04:56:00',
                  ),
                  validator: (value) {
                    final startValidated =
                        DateTime.tryParse(value ?? '') != null;
                    final endValidated =
                        DateTime.tryParse(endController.text) != null;
                    if (startValidated || endValidated) {
                      return null;
                    }
                    return AppLocalizations.of(context)!.time_error;
                  },
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: endController,
                  decoration: InputDecoration(
                    labelText:
                        '${AppLocalizations.of(context)!.end} GMT (2023-01-23 04:56:00)',
                    hintText: '2023-01-23 04:56:00',
                  ),
                ),
              )
            ],
          ),
          ResponsiveRowColumn(
            rowSpacing: 8,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: srstController,
                  decoration: const InputDecoration(
                    labelText: 'RST S',
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: TextFormField(
                  controller: rrstController,
                  decoration: const InputDecoration(
                    labelText: 'RST R',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void reset() {
    formKey.currentState?.reset();
  }
}

/// ライセンス形態選択ボタン
class _LicenseTypeSelectionButton extends StatefulWidget {
  const _LicenseTypeSelectionButton({
    super.key,
    required this.canChangeLicenseMode,
    required this.licenseTypeNotifier,
  });
  final bool canChangeLicenseMode;
  final ValueNotifier<LicenseType> licenseTypeNotifier;

  @override
  State<StatefulWidget> createState() {
    return _LicenseTypeSelectionButtonState();
  }
}

class _LicenseTypeSelectionButtonState
    extends State<_LicenseTypeSelectionButton> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: [
        for (final licenseType in LicenseType.values)
          ButtonSegment(
            label: Text(licenseType.localizedDescription(context)),
            value: licenseType,
            icon: Icon(licenseType.icon),
          )
      ],
      selected: {
        widget.licenseTypeNotifier.value,
      },
      onSelectionChanged: (value) {
        setState(() {
          if (widget.canChangeLicenseMode) {
            widget.licenseTypeNotifier.value = value.first;
          }
        });
      },
    );
  }
}

TextInputFormatFunction _uppercaseFormatter = (oldValue, newValue) {
  return TextEditingValue(
    text: newValue.text.toUpperCase(),
    selection: newValue.selection,
  );
};
