import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:travel_information_app/models/theme/global.dart';
import 'package:travel_information_app/userinterface/mappage/UserLocationPin.dart';
import 'package:travel_information_app/userinterface/routepages/routepage/LocationPin.dart';
import 'package:latlong2/latlong.dart';

/// Displays a map with a polyline route, start and destination and user location.
class PolylineView extends StatefulWidget {
  final String encodedPolyline;

  PolylineView({Key? key, required this.encodedPolyline}) : super(key: key);

  @override
  _PolylineViewState createState() => _PolylineViewState();
}

class _PolylineViewState extends State<PolylineView> {
  List<Marker>? _markerList;

  @override
  Widget build(BuildContext context) {
    /// Polyline, origin and destination location.
    List<LatLng> polyline = this.retrievePolyline(widget.encodedPolyline);
    LatLng origin = polyline.first;
    LatLng destination = polyline.last;

    /// Markers for origin, destination and user.
    _markerList = this.getMarkerList(origin, destination);
    //TODO decide what to do
    //this._addUserLocationMarker();

    return FlutterMap(
      options: MapOptions(
        bounds: LatLngBounds(origin, destination),
        boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(25)),
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        PolylineLayerOptions(polylines: [
          Polyline(
            points: polyline,
            strokeWidth: 4,
            color: Colors.blue,
          ),
        ]),
        MarkerLayerOptions(
          markers: this._markerList!,
        ),
      ],
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

  /// Initiates the marker list for [origin] and [destination].
  List<Marker> getMarkerList(LatLng origin, LatLng destination) {
    List<Marker> markers = [];

    /// Origin marker
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: origin,
        anchorPos: AnchorPos.exactly(Anchor(42, 17)),
        builder: (context) => Container(
          child: LocationPin(
            color: grey.withOpacity(0.9),
          ),
        ),
      ),
    );

    /// Destination marker
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: destination,
        anchorPos: AnchorPos.exactly(Anchor(42, 17)),
        builder: (context) => Container(
          child: LocationPin(color: Colors.blue.withOpacity(0.9)),
        ),
      ),
    );

    return markers;
  }

  /// Retrieves the user location marker.
  /// Adds the user location marker to the marker list.
  void _addUserLocationMarker() {
    UserLocationPin.getUserLocation().then((value) {
      this.setState(() {
        _markerList!.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: value,
            anchorPos: AnchorPos.exactly(Anchor(42, 17)),
            builder: (context) => Container(
              child: UserLocationPin(
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ),
        );
      });
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to receive user position.')));
    });
  }
}
