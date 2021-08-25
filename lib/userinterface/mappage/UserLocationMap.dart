import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'UserLocationPin.dart';

/// Map background that displays a user location.
class UserLocationMap extends StatelessWidget {
  final LatLng? userLocation;

  UserLocationMap({this.userLocation});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: userLocation,
        zoom: 16.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: userLocation!,
              anchorPos: AnchorPos.exactly(Anchor(42, 17)),
              builder: (context) => Container(
                child: UserLocationPin(
                  color: Colors.black.withOpacity(0.75),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
