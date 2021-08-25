import 'package:flutter/material.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResponse.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResult.dart';
import 'package:travel_information_app/routes/Routes.dart';
import 'package:travel_information_app/userinterface/routepages/routepage/RouteViewPageArgument.dart';

import 'RoutesPageArgument.dart';

class RoutesPage extends StatelessWidget {
  static const String routeName = "/routes";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RoutesPageArgument;
    RoutingResponse response = args.response;

    return Scaffold(
      appBar: AppBar(
        title: Text("routes"),
      ),
      body: ListView(
        children: this.generateTiles(context, response.routes),
      ),
    );
  }

  /// Generates a ListTile  for every provided route
  List<Widget> generateTiles(BuildContext context, List<RoutingResult> routes) {
    List<Widget> tiles = [];
    routes.forEach((element) {
      double distanceInKM = element.distanceInMeters / 1000;
      tiles.add(
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 15, 30, 0),
          title: Text("route"),
          trailing: Icon(
            Icons.map_outlined,
            size: 50,
          ),
          subtitle: Text("distance: " +
              distanceInKM.toStringAsFixed(2) +
              " km\n" +
              "duration: " +
              element.durationInMinutes.toStringAsFixed(0) +
              " min\n" +
              "departure time: " +
              element.departureTime +
              "\n" +
              "arrival time: " +
              element.arrivalTime +
              "\n" +
              "number of transfers: " +
              element.numberOfTransfers.toString() +
              "\n"),
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.routeView,
              arguments: RouteViewPageArgument(element),
            );
          },
        ),
      );
      tiles.add(Divider());
    });
    return tiles;
  }
}
