import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/APIProvider.dart';
import 'package:travel_information_app/models/forms/FormPage.dart';
import 'package:travel_information_app/models/forms/LoadingCircle.dart';
import 'package:travel_information_app/models/preferenceservice/StandardRequest.dart';
import 'package:travel_information_app/models/preferenceservice/user/profile/UserProfile.dart';
import 'package:travel_information_app/models/user/User.dart';
import 'package:travel_information_app/userinterface/userprofilepage/UserProfileForm.dart';

class UserProfilePage extends StatefulWidget {
  static const String routeName = "/profile";

  UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  /// Serves as a placeholder until account information is received.
  Widget _child = LoadingCircle(
    leftPadding: 148,
    topPadding: 0,
    rightPadding: 148,
    bottomPadding: 0,
  );

  @override
  void initState() {
    super.initState();
    this.receiveUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return FormPage(
      title: 'user profile',
      iconData: Icons.account_circle,
      child: this._child,
    );
  }

  /// Requests the user profile at the backend server.
  /// Sets values accordingly.
  receiveUserProfile() {
    APIProvider apiProvider = new APIProvider();
    Map<String, dynamic> requestBody =
        StandardRequest(User().getAccessToken()).toJson();
    Future<Map<String, dynamic>> userProfileJson =
        apiProvider.httpPost('user/profile', requestBody);
    userProfileJson.then((value) {
      UserProfile userProfile = UserProfile.fromJson(value);
      setState(() {
        this._child = UserProfileForm(
            accessibility: userProfile.accessibility,
            canRideABike: userProfile.canRideABike,
            grantGPS: userProfile.grantGPS,
            hasDriversLicence: userProfile.hasDriversLicence,
            privateBicycleAvailable: userProfile.privateBicycleAvailable,
            privateCarAvailable: userProfile.privateCarAvailable);
      });
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to receive user profile.')));
    });
  }
}
