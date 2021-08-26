import 'package:flutter/material.dart';

/// A Location pin to display a location on the map.
class LocationPin extends StatelessWidget {
  final Color? color;

  LocationPin({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_pin,
      size: 60,
      color: color!,
    );
  }
}
