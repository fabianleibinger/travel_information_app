import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

/// A user location pin to display the user position on the map.
class UserLocationPin extends StatelessWidget {
  final Color? color;

  UserLocationPin({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_history,
      size: 60,
      color: color!,
    );
  }

  /// Receives and returns the current location of the user.
  static Future<LatLng> getUserLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw Exception("Location service not enabled.");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception("Permission to access location denied.");
      }
    }
    _locationData = await location.getLocation();
    return LatLng(_locationData.latitude!, _locationData.longitude!);
  }
}