import 'package:flutter/material.dart';
import 'package:travel_information_app/models/forms/DialogListTile.dart';
import 'package:travel_information_app/models/forms/RouteListTile.dart';
import 'package:travel_information_app/models/forms/FormPage.dart';
import 'package:travel_information_app/models/user/User.dart';
import 'package:travel_information_app/routes/Routes.dart';
import 'package:travel_information_app/userinterface/settingspage/logoutdialog/LogoutDialog.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return FormPage(
      title: 'settings',
      iconData: Icons.settings,
      child: Column(
        children: this.getTiles(),
      ),
    );
  }

  /// Returns child Widgets for settings.
  /// Checks if user is logged in and returns widgets accordingly.
  List<Widget> getTiles() {
    List<Widget> tiles = [];
    if (User().isLoggedIn()) {
      tiles.add(
        RouteListTile(
          title: 'account',
          iconData: Icons.account_circle,
          route: Routes.account,
        ),
      );
      tiles.add(
        DialogListTile(
          title: 'logout',
          iconData: Icons.logout_rounded,
          dialog: LogoutDialog(),
        ),
      );
    }
    return tiles;
  }
}
