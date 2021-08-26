import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResult.dart';
import 'package:travel_information_app/userinterface/routepages/PolylineView.dart';
import 'package:travel_information_app/userinterface/routepages/routeviewpage/routesegmentswidget/RouteSegmentsWidget.dart';
import 'RouteViewPageArgument.dart';

/// Displays a PolylineView for a route and SlidingUpPanel for route segments.
class RouteViewPage extends StatelessWidget {
  static const String routeName = "/routeView";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RouteViewPageArgument;
    RoutingResult route = args.route;

    return Scaffold(
      appBar: AppBar(
        title: Text("route"),
      ),
      body: SlidingUpPanel(
        minHeight: 55,
        backdropEnabled: true,
        panel: Column(
          children: [
            ListTile(
              leading: Icon(Icons.segment_rounded),
              title: Text("segments"),
            ),
            Expanded(
              child: RouteSegmentsWidget(segments: route.segments),
            ),
          ],
        ),
        body: PolylineView(
          encodedPolyline: route.encodedPolyline,
        ),
      ),
    );
  }
}
