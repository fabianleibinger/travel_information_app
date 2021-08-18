import 'package:flutter/material.dart';
import 'package:travel_information_app/models/forms/BasicListTile.dart';
import 'package:travel_information_app/models/forms/FormPage.dart';
import 'package:travel_information_app/models/user/User.dart';
import 'package:travel_information_app/routes/Routes.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return FormPage(
      title: 'settings',
      iconData: Icons.settings,
      form: Column(
        children: this.getTiles(),
      ),
    );
  }

  /// Returns BasicListTiles for settings.
  /// Checks if user is logged in and returns tiles accordingly.
  List<BasicListTile> getTiles() {
    User user = User();
    bool isLoggedIn = user.isLoggedIn();

    List<BasicListTile> tiles = [];
    if (isLoggedIn) {
      tiles.add(
        BasicListTile(
          title: 'account',
          iconData: Icons.account_circle,
          route: Routes.account,
        ),
      );
      tiles.add(
        BasicListTile(
          title: 'logout',
          iconData: Icons.logout_rounded,
          route: '',
        ),
      );
    }
    return tiles;
  }
}
