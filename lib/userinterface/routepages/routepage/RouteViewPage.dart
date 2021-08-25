import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResult.dart';
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
    RoutingResult route = args.route;

    /// Retrieving polyline.
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> polyline =
        polylinePoints.decodePolyline(route.encodedPolyline);

    /// Model conversion.
    PointLatLng originPoint = polyline.first;
    PointLatLng destinationPoint = polyline.last;
    LatLng origin = LatLng(originPoint.latitude, originPoint.longitude);
    LatLng destination =
        LatLng(destinationPoint.latitude, destinationPoint.longitude);

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
                      child: LocationPin(
                        color: grey.withOpacity(0.9),
                      ),
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
