import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/ApiProvider.dart';
import 'package:travel_information_app/models/preferenceservice/StandardRequest.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/PreferenceProfile.dart';
import 'package:travel_information_app/models/preferenceservice/user/profile/UserProfile.dart';
import 'package:travel_information_app/models/routingservice/request/GoogleLatLng.dart';
import 'package:travel_information_app/models/routingservice/request/RoutingRequest.dart';
import 'package:travel_information_app/models/routingservice/request/RoutingRequestWithoutMobilityPreferences.dart';
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
      onPressed: () => this._onPressed(context),
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

  /// Sends a routing request to the backend service.
  void _onPressed(BuildContext context) {
    GoogleLatLng startLocation;
    GoogleLatLng destinationLocation;
    String routingService;
    PreferenceProfile? preferenceProfile;
    UserProfile? userProfile;

    bool preferenceProfileSelected;

    ApiProvider apiProvider = new ApiProvider();
    Future<Map<String, dynamic>> routingResponseJson;

    /// Getting locations.
    List<String> startLatLng = this.startLocationController.text.split(" ");
    List<String> destinationLatLng = this.destinationController.text.split(" ");
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

    /// Getting routing service.
    routingService = User().receiveRoutingService();

    /// Getting preference profile.
    try {
      preferenceProfile = User().getPreferenceProfile();
      preferenceProfileSelected = true;
    } on TypeError catch (e) {
      preferenceProfileSelected = false;
    }

    if (User().isLoggedIn() && preferenceProfileSelected) {
      preferenceProfile = User().getPreferenceProfile();

      /// Getting user profile.
      ApiProvider apiProvider = new ApiProvider();
      Future<Map<String, dynamic>> userProfileJson = apiProvider.httpPost(
          'user/profile',
          new StandardRequest(User().getAccessToken()).toJson());
      userProfileJson.then((value) {
        userProfile = UserProfile.fromJson(value);
      }).whenComplete(() {
        /// Building the routing request.
        RoutingRequest routingRequest = new RoutingRequest(
            startLocation,
            destinationLocation,
            routingService,
            preferenceProfile!,
            userProfile!);

        /// Sending the routing request.
        print(routingRequest.toJson());
        routingResponseJson =
            apiProvider.httpPost('routing', routingRequest.toJson());
        routingResponseJson.then((value) {
          print(value);
        }).onError((error, stackTrace) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Failed to receive routes.')));
        });
      });
    } else {
      /// Building the routing request without mobility preferences.
      RoutingRequestWithoutMobilityPreferences routingRequest =
          new RoutingRequestWithoutMobilityPreferences(
              startLocation, destinationLocation, routingService);

      /// Sending the routing request.
      print(routingRequest.toJson());
      routingResponseJson =
          apiProvider.httpPost('routing', routingRequest.toJson());
      routingResponseJson.then((value) {
        print(value);
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to receive routes.')));
      });
    }
  }
}
