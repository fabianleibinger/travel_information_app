import 'package:flutter/material.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResultSegment.dart';

import 'RouteSegmentsPageArgument.dart';

class RouteSegmentsPage extends StatefulWidget {
  static const String routeName = "/routeSegments";

  RouteSegmentsPage({Key? key}) : super(key: key);

  @override
  _RouteSegmentsPageState createState() => _RouteSegmentsPageState();
}

class _RouteSegmentsPageState extends State<RouteSegmentsPage> {
  List<bool>? _isOpen;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RouteSegmentsPageArgument;
    List<RoutingResultSegment> segments = args.routeSegments;

    return Scaffold(
        appBar: AppBar(
          title: Text("segments"),
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            children: this.generatePanels(context, segments),
          ),
        ));
  }

  /// Generates an ExpansionPanel for every segment.
  List<ExpansionPanel> generatePanels(
      BuildContext context, List<RoutingResultSegment> segments) {
    List<ExpansionPanel> panels = [];

    segments.forEach((element) {
      double distanceInKM = element.distanceInMeters / 1000;

      panels.add(ExpansionPanel(
        isExpanded: true,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 15, 30, 0),
            subtitle: Text("mode: " +
                element.modeOfTransport +
                "\n" +
                "distance: " +
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
                "ascent: " +
                element.ascent.toString() +
                " m\n" +
                "descent: " +
                element.descent.toString() +
                " m\n"),
          );
        },
        body: Text("is jeff"),
      ));
    });

    return panels;
  }
}
