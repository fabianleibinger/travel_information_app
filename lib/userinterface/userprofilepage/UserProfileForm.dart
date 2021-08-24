import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/ApiProvider.dart';
import 'package:travel_information_app/models/preferenceservice/user/profile/UserProfile.dart';
import 'package:travel_information_app/models/preferenceservice/user/profile/UserProfilePutRequest.dart';
import 'package:travel_information_app/models/user/User.dart';
import 'package:travel_information_app/routes/Routes.dart';

class UserProfileForm extends StatefulWidget {
  final bool? accessibility;
  final bool? canRideABike;
  final bool? grantGPS;
  final bool? hasDriversLicence;
  final bool? privateBicycleAvailable;
  final bool? privateCarAvailable;

  UserProfileForm(
      {Key? key,
      @required this.accessibility,
      @required this.canRideABike,
      @required this.grantGPS,
      @required this.hasDriversLicence,
      @required this.privateBicycleAvailable,
      @required this.privateCarAvailable})
      : super(key: key);

  @override
  _UserProfileFormState createState() => _UserProfileFormState(
      accessibility: this.accessibility,
      canRideABike: this.canRideABike,
      grantGPS: this.grantGPS,
      hasDriversLicence: this.hasDriversLicence,
      privateBicycleAvailable: this.privateBicycleAvailable,
      privateCarAvailable: this.privateCarAvailable);
}

class _UserProfileFormState extends State<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();

  bool? accessibility;
  bool? canRideABike;
  bool? grantGPS;
  bool? hasDriversLicence;
  bool? privateBicycleAvailable;
  bool? privateCarAvailable;

  _UserProfileFormState(
      {this.accessibility,
      this.canRideABike,
      this.grantGPS,
      this.hasDriversLicence,
      this.privateBicycleAvailable,
      this.privateCarAvailable});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SwitchListTile(
            title: Text('accessibility'),
            onChanged: (value) => setState(() => this.accessibility = value),
            value: this.accessibility!,
          ),
          SwitchListTile(
            title: Text('can ride a bike'),
            onChanged: (value) => setState(() => this.canRideABike = value),
            value: this.canRideABike!,
          ),
          SwitchListTile(
            title: Text('grant gps'),
            onChanged: (value) => setState(() => this.grantGPS = value),
            value: this.grantGPS!,
          ),
          SwitchListTile(
            title: Text('drivers license'),
            onChanged: (value) =>
                setState(() => this.hasDriversLicence = value),
            value: this.hasDriversLicence!,
          ),
          SwitchListTile(
            title: Text('private bicycle'),
            onChanged: (value) =>
                setState(() => this.privateBicycleAvailable = value),
            value: this.privateBicycleAvailable!,
          ),
          SwitchListTile(
            title: Text('private car'),
            onChanged: (value) =>
                setState(() => this.privateCarAvailable = value),
            value: this.privateCarAvailable!,
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: FloatingActionButton.extended(
              onPressed: () => submit(),
              label: Text("submit"),
            ),
          ),
        ],
      ),
    );
  }

  submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ApiProvider apiProvider = new ApiProvider();
      Future<Map<String, dynamic>> userProfileJson = apiProvider.httpPut(
        'user/profile',
        new UserProfilePutRequest(
          User().getAccessToken(),
          new UserProfile(
              this.accessibility!,
              this.canRideABike!,
              this.grantGPS!,
              this.hasDriversLicence!,
              this.privateBicycleAvailable!,
              this.privateCarAvailable!),
        ).toJson(),
      );
      print(new UserProfilePutRequest(
        User().getAccessToken(),
        new UserProfile(
            this.accessibility!,
            this.canRideABike!,
            this.grantGPS!,
            this.hasDriversLicence!,
            this.privateBicycleAvailable!,
            this.privateCarAvailable!),
      ).toJson());
      userProfileJson.then((value) {
        Navigator.pushReplacementNamed(context, Routes.map);
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to edit user profile.')));
      });
    }
  }
}
