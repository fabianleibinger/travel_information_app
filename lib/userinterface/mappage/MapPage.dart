import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travel_information_app/models/forms/LoadingCircle.dart';
import 'package:travel_information_app/userinterface/drawer/AppDrawer.dart';
import 'package:travel_information_app/userinterface/mappage/LocationPin.dart';
import 'package:travel_information_app/userinterface/mappage/LocationSearchField.dart';
import 'CalcRouteButton.dart';
import 'LocationMap.dart';

/// The home page of this app.
class MapPage extends StatefulWidget {
  static const String routeName = "/map";

  MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  LatLng? _userLocation;
  final _startLocationController = TextEditingController();
  final _destinationController = TextEditingController();

  Widget _map = Center(
    child: LoadingCircle(
        leftPadding: 0, rightPadding: 0, topPadding: 0, bottomPadding: 0),
  );
  Widget _slidingPanelContent = Center(
    child: LoadingCircle(
        leftPadding: 0, rightPadding: 0, topPadding: 0, bottomPadding: 0),
  );

  @override
  void initState() {
    this._initMapLocation();
    super.initState();
  }

  @override
  void dispose() {
    _startLocationController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      floatingActionButton: CalcRouteButton(
        startLocationController: this._startLocationController,
        destinationController: this._destinationController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SlidingUpPanel(
        minHeight: 25,
        backdropEnabled: true,
        panel: Column(
          children: [
            Icon(Icons.keyboard_arrow_up_rounded),
            Expanded(
              child: this._slidingPanelContent,
            )
          ],
        ),
        body: Stack(
          children: [
            _map,
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).padding.top,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                    icon: Icon(Icons.menu),
                  ),
                ),
                LocationSearchField(
                  labelText: "start location",
                  controller: this._startLocationController,
                ),
                LocationSearchField(
                  labelText: "destination",
                  controller: this._destinationController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Receives map and location information to be displayed.
  void _initMapLocation() {
    Future<LatLng> currentPosition = LocationPin.getUserLocation();
    currentPosition
        .then((value) => setState(() {
              _userLocation = value;
              _map = LocationMap(
                userLocation: _userLocation,
              );
            }))
        .onError((error, stackTrace) => ScaffoldMessenger.of(context)
            .showSnackBar(
                SnackBar(content: Text('Failed to receive user position.'))));
  }
}
