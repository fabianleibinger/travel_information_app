import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/ApiProvider.dart';
import 'package:travel_information_app/models/forms/LoadingCircle.dart';
import 'package:travel_information_app/models/NameList.dart';
import 'package:travel_information_app/models/preferenceservice/StandardRequest.dart';
import 'package:travel_information_app/models/preferenceservice/user/preferenceprofiles/PreferenceProfile.dart';
import 'package:travel_information_app/routes/Routes.dart';
import 'package:travel_information_app/models/user/User.dart';

import 'AppDrawer.dart';

/// Content to be displayed in the AppDrawer, if user is logged in.
class UserDrawerContent extends StatefulWidget {
  UserDrawerContent({Key? key}) : super(key: key);

  _UserDrawerContentState createState() => _UserDrawerContentState();
}

class _UserDrawerContentState extends State<UserDrawerContent> {
  String _selectedTile = User().receivePreferenceProfileName();

  Widget _preferenceTiles = LoadingCircle(
    leftPadding: 133,
    topPadding: 30,
    rightPadding: 133,
    bottomPadding: 30,
  );

  @override
  void initState() {
    super.initState();
    generatePreferenceTiles(context);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        showTrackOnHover: true,
        radius: Radius.circular(10),
        child: ListView(
          padding: AppDrawer.listViewPadding,
          children: [
            this._preferenceTiles,
            Divider(),
            AppDrawer.generateTile(context, "preference profiles",
                Icons.mode_edit, Routes.preferenceProfiles),
            AppDrawer.generateTile(context, "user profile",
                Icons.account_circle, Routes.userProfile),
            AppDrawer.generateTile(
                context, "settings", Icons.settings, Routes.settings),
          ],
        ),
      ),
    );
  }

  /// Generates the preference profile tiles to be displayed.
  /// Updates this content widget.
  /// Requests the preference profiles of the user at the backend server.
  void generatePreferenceTiles(context) {
    List<ListTile> list = [];
    ApiProvider apiProvider = new ApiProvider();
    Future<Map<String, dynamic>> nameListJson = apiProvider.httpPost(
        'user/preferenceProfiles',
        new StandardRequest(User().getAccessToken()).toJson());
    nameListJson.then((value) {
      NameList nameList = NameList.fromJson(value);
      nameList.names.forEach((name) {
        list.add(getPreferenceTile(context, name, Icons.map_outlined));
      });
      setState(() {
        this._preferenceTiles = Column(children: list);
      });
    });
  }

  /// Returns a List Tile for a preference profile.
  ListTile getPreferenceTile(BuildContext context, String name, IconData icon) {
    return ListTile(
      selected: name == this._selectedTile,
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        selectPreferenceProfile(name);
      },
    );
  }

  /// Selects the current preference profile.
  /// Receives the preference profile from the backend server.
  void selectPreferenceProfile(String name) {
    ApiProvider apiProvider = new ApiProvider();
    Future<Map<String, dynamic>> preferenceProfileJson =
    apiProvider.httpPost(
      'user/preferenceProfiles/' + name,
      new StandardRequest(User().getAccessToken()).toJson(),
    );
    preferenceProfileJson.then((value) {
      PreferenceProfile preferenceProfile =
      PreferenceProfile.fromJson(value);
      User().setPreferenceProfile(preferenceProfile);
      setState(() {
        this._selectedTile = User().receivePreferenceProfileName();
      });
    });
  }
}
