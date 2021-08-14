import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_information_app/models/global.dart';
import 'package:travel_information_app/userinterface/mappage/LocationSearchField.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  final double borderRadius = 30;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: LatLng(51.5, -0.09),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(51.5, -0.09),
                      builder: (ctx) => Container(
                        child: FlutterLogo(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment(0, -0.75),
              child: LocationSearchField(),
            ),
          ],
        ));
  }
}
