import 'package:flutter/material.dart';

/// 情報ポップアップを表示するMarkerの子要素
class InformationMarker extends StatefulWidget {
  const InformationMarker({
    super.key,
    required this.information,
    required this.markerChild,
    this.onTap,
  });
  final Widget information;
  final Widget markerChild;
  final GestureTapCallback? onTap;

  @override
  State<StatefulWidget> createState() => InformationMarkerState();
}

class InformationMarkerState extends State<InformationMarker> {
  bool _onSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onTap?.call();
          _onSelected = true;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.markerChild,
          if (_onSelected)
            GestureDetector(
              onTap: dismissInfomation,
              child: widget.information,
            ),
        ],
      ),
    );
  }

  void dismissInfomation() {
    setState(() {
      _onSelected = false;
    });
  }
}
