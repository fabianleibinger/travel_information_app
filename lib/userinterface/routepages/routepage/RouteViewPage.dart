import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResult.dart';
import 'package:travel_information_app/models/theme/global.dart';
import 'package:travel_information_app/userinterface/routepages/routepage/LocationPin.dart';
import 'package:latlong2/latlong.dart';
import 'RouteViewPageArgument.dart';

/// Displays a map with a polyline route, start and destination and user location.
class RouteViewPage extends StatelessWidget {
  static const String routeName = "/routeView";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RouteViewPageArgument;
    RoutingResult route = args.route;

    /// Polyline, origin and destination location.
    List<LatLng> polyline = this.retrievePolyline(route.encodedPolyline);
    LatLng origin = polyline.first;
    LatLng destination = polyline.last;

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
              PolylineLayerOptions(polylines: [
                Polyline(
                  points: polyline,
                  strokeWidth: 4,
                  color: Colors.blue,
                ),
              ]),
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

  /// Retrieves the polyline from a google encoded polyline.
  List<LatLng> retrievePolyline(String encodedPolyline) {
    List<LatLng> polyline = [];

    /// Retrieving polyline.
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> googlePolyline =
        polylinePoints.decodePolyline(encodedPolyline);

    /// Model conversion.
    googlePolyline.forEach((element) {
      polyline.add(LatLng(element.latitude, element.longitude));
    });

    return polyline;
  }
}
