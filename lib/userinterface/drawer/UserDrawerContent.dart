import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/APIProvider.dart';
import 'package:travel_information_app/models/forms/LoadingCircle.dart';
import 'package:travel_information_app/models/preferenceservice/NameList.dart';
import 'package:travel_information_app/models/preferenceservice/StandardRequest.dart';
import 'package:travel_information_app/routes/Routes.dart';
import 'package:travel_information_app/models/user/User.dart';

import 'AppDrawer.dart';

/// Content to be displayed in the AppDrawer, if user is logged in.
class UserDrawerContent extends StatefulWidget {
  UserDrawerContent({Key? key}) : super(key: key);

  _UserDrawerContentState createState() => _UserDrawerContentState();
}

class _UserDrawerContentState extends State<UserDrawerContent> {
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
    APIProvider apiProvider = new APIProvider();
    Future<Map<String, dynamic>> nameListJson = apiProvider.httpPost(
        'user/preferenceProfiles',
        new StandardRequest(User().getAccessToken()).toJson());
    nameListJson.then((value) {
      NameList nameList = NameList.fromJson(value);
      nameList.names.forEach((name) {
        list.add(AppDrawer.generateTile(
            context, name, Icons.map_outlined, Routes.map));
      });
      setState(() {
        this._preferenceTiles = Column(children: list);
      });
    });
  }
}
