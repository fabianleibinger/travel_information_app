import 'package:flutter/material.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResult.dart';
import 'package:travel_information_app/routes/Routes.dart';
import 'package:travel_information_app/userinterface/routepages/PolylineView.dart';
import 'package:travel_information_app/userinterface/routepages/routesegmentspage/RouteSegmentsPageArgument.dart';
import 'RouteViewPageArgument.dart';

/// Displays a PolylineView and a button to lead to RoutingResultSegments.
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.routeSegments,
            arguments: RouteSegmentsPageArgument(route.segments),
          );
        },
        label: Text("segments"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PolylineView(
        encodedPolyline: route.encodedPolyline,
      ),
    );
  }
}
