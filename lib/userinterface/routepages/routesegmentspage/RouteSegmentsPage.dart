import 'package:flutter/material.dart';
import 'package:travel_information_app/models/routingservice/response/RoutingResultSegment.dart';
import 'package:travel_information_app/routes/Routes.dart';
import 'package:travel_information_app/userinterface/routepages/routesegmentviewpage/RouteSegmentViewPageArgument.dart';

import 'SegmentPanelData.dart';
import 'RouteSegmentsPageArgument.dart';

/// Displays a list of route segments from a List<RoutingResultSegment> argument.
class RouteSegmentsPage extends StatefulWidget {
  static const String routeName = "/routeSegments";

  RouteSegmentsPage({Key? key}) : super(key: key);

  @override
  _RouteSegmentsPageState createState() => _RouteSegmentsPageState();
}

class _RouteSegmentsPageState extends State<RouteSegmentsPage> {
  late List<SegmentPanelData> _panelData;
  bool _needInit = true;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RouteSegmentsPageArgument;
    List<RoutingResultSegment> segments = args.routeSegments;

    /// init _panelData only once.
    if (_needInit) {
      this._panelData = this.generatePanelData(context, segments);
      _needInit = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("segments"),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            ExpansionPanelList(
              children:
                  this._panelData.map<ExpansionPanel>((SegmentPanelData data) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return data.header;
                  },
                  body: data.body,
                  isExpanded: data.expanded,
                );
              }).toList(),
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  this._panelData[index].expanded =
                      !this._panelData[index].expanded;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Generates the data to be displayed in the panels.
  List<SegmentPanelData> generatePanelData(
      BuildContext context, List<RoutingResultSegment> segments) {
    return List<SegmentPanelData>.generate(segments.length, (int index) {
      RoutingResultSegment segment = segments[index];
      return SegmentPanelData(
        header: ListTile(
          contentPadding: EdgeInsets.fromLTRB(30, 15, 30, 0),
          title: Text("segment " + (index + 1).toString()),
          subtitle: this._getPanelHeader(segment),
          trailing: Icon(Icons.map_outlined, size: 50),
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.segmentView,
              arguments: RouteSegmentViewPageArgument(segment),
            );
          },
        ),
        body: Column(
          children: this._getPanelBodyTiles(segment),
        ),
      );
    });
  }

  /// Returns the header text widget of a panel including segment information.
  Widget _getPanelHeader(RoutingResultSegment segment) {
    double distanceInKM = segment.distanceInMeters / 1000;
    String text = "mode: " +
        segment.modeOfTransport +
        "\n" +
        "distance: " +
        distanceInKM.toStringAsFixed(2) +
        " km\n" +
        "duration: " +
        segment.durationInMinutes.toStringAsFixed(0) +
        " min\n" +
        "departure time: " +
        segment.departureTime +
        "\n" +
        "arrival time: " +
        segment.arrivalTime +
        "\n";
    double doubleDefault = RoutingResultSegment.DOUBLE_DEFAULT;
    if (segment.ascent != doubleDefault && segment.descent != doubleDefault) {
      text += "ascent: " +
          segment.ascent.toString() +
          " m\n" +
          "descent: " +
          segment.descent.toString() +
          " m\n";
    }
    return Text(text);
  }

  /// Returns the instruction tiles as body of a panel.
  List<Widget> _getPanelBodyTiles(RoutingResultSegment segment) {
    List<Widget> tiles = [];
    tiles.add(Text(
      "instructions: ",
      style: TextStyle(fontSize: 30),
    ));
    tiles.add(Divider());
    segment.instructions.forEach((element) {
      tiles.add(ListTile(title: Text(element)));
    });
    return tiles;
  }
}
