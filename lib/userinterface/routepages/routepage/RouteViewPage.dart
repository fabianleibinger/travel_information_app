import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:travel_information_app/models/theme/global.dart';
import 'package:travel_information_app/userinterface/routepages/routepage/LocationPin.dart';
import 'package:latlong2/latlong.dart';
import 'RouteViewPageArgument.dart';

class RouteViewPage extends StatelessWidget {
  static const String routeName = "/routeView";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RouteViewPageArgument;

    LatLng origin = LatLng(49, 8);
    LatLng destination = LatLng(49, 9);

    return Scaffold(
      appBar: AppBar(
        title: Text("route"),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              bounds: LatLngBounds(origin, destination),
              boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(25)),
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
                    point: origin,
                    anchorPos: AnchorPos.exactly(Anchor(42, 17)),
                    builder: (ctx) => Container(
                      child: LocationPin(color: grey.withOpacity(0.9),),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: destination,
                    anchorPos: AnchorPos.exactly(Anchor(42, 17)),
                    builder: (ctx) => Container(
                      child: LocationPin(color: Colors.blue.withOpacity(0.9)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
