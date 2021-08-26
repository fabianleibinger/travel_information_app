import 'package:flutter/material.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResultSegment.dart';
import 'package:travel_information_app/userinterface/routepages/PolylineView.dart';

import 'RouteSegmentViewPageArgument.dart';

/// Displays a PolylineView for a route segment.
class RouteSegmentViewPage extends StatelessWidget {
  static const String routeName = "/segmentView";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as RouteSegmentViewPageArgument;
    RoutingResultSegment segment = args.segment;

    return Scaffold(
      appBar: AppBar(
        title: Text("segment"),
      ),
      body: PolylineView(
        encodedPolyline: segment.encodedPolyline,
      ),
    );
  }
}
