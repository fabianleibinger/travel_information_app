import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/APIProvider.dart';
import 'package:travel_information_app/models/preferenceservice/StandardRequest.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/PreferenceProfile.dart';
import 'package:travel_information_app/models/preferenceservice/user/profile/UserProfile.dart';
import 'package:travel_information_app/models/routingservice/GoogleLatLng.dart';
import 'package:travel_information_app/models/routingservice/RoutingRequest.dart';
import 'package:travel_information_app/models/user/User.dart';

/// Button on the MapPage, that initiates route calculation.
class CalcRouteButton extends StatelessWidget {
  final startLocationController;
  final destinationController;

  CalcRouteButton({
    @required this.startLocationController,
    @required this.destinationController,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => this._onPressed(),
      label: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 12, 0),
            child: Text("route"),
          ),
          Icon(Icons.directions_rounded),
        ],
      ),
    );
  }

  //TODO routing service
  void _onPressed() {
    GoogleLatLng startLocation;
    GoogleLatLng destinationLocation;
    String routingService;
    PreferenceProfile? preferenceProfile;
    UserProfile? userProfile;

    List<String> startLatLng = startLocationController.text.split(" ");
    List<String> destinationLatLng = destinationController.text.split(" ");
    try {
      startLocation = GoogleLatLng(
        double.tryParse(startLatLng.first)!,
        double.tryParse(startLatLng.last)!,
      );
      destinationLocation = GoogleLatLng(
        double.tryParse(destinationLatLng.first)!,
        double.tryParse(destinationLatLng.last)!,
      );
    } on TypeError catch (e) {
      return;
    }

    routingService = "Openrouteservice";

    if (User().isLoggedIn()) {
      preferenceProfile = User().getPreferenceProfile();

      APIProvider apiProvider = new APIProvider();
      Future<Map<String, dynamic>> userProfileJson = apiProvider.httpPost(
          'user/profile',
          new StandardRequest(User().getAccessToken()).toJson());
      userProfileJson.then((value) {
        userProfile = UserProfile.fromJson(value);
      }).whenComplete(() {
        RoutingRequest routingRequest = new RoutingRequest(
            startLocation,
            destinationLocation,
            routingService,
            preferenceProfile!,
            userProfile!);

        print(routingRequest.toJson());
      });
    }
  }
}
