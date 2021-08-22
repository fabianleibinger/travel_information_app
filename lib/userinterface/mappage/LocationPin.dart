import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

/// A Location pin to display a location on the map.
class LocationPin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_pin,
      size: 60,
      color: Colors.black.withOpacity(0.75),
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
