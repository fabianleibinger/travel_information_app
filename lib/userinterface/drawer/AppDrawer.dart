import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_information_app/models/global.dart';
import 'package:travel_information_app/models/user/User.dart';
import 'package:travel_information_app/userinterface/drawer/LoginDrawerContent.dart';
import 'package:travel_information_app/userinterface/drawer/UserDrawerContent.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer([this.currentPage]);

  final String? currentPage;

  static final EdgeInsets drawerHeaderPadding = EdgeInsets.all(16.0);
  static final EdgeInsets listViewPadding = EdgeInsets.fromLTRB(0, 8, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            padding: drawerHeaderPadding,
            width: MediaQuery.of(context).size.width,
            child: Text("Travel Information App", style: whiteHeader),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                bottom: Divider.createBorderSide(context),
              ),
            ),
          ),
          //Drawer Content
          getDrawerContent(),
        ],
      ),
    );
  }

  /// Returns drawer content according to the logged in status of the user.
  Widget getDrawerContent() {
    bool isLoggedIn = User().isLoggedIn();
    if (isLoggedIn) {
      return UserDrawerContent();
    } else {
      return LoginDrawerContent();
    }
  }

  /// Generates a single standard tile for the [ListView] in the [AppDrawer]
  /// [text] shown on tile
  /// [icon] shown to the left of the text on the tile
  /// [route] to page that shall be opened on tap
  static ListTile generateTile(
      BuildContext context, String text, IconData icon, String route) {
    return ListTile(
        //selected: currentDrawer == route ? true : false,
        leading: Icon(icon),
        title: Text(text),
        onTap: () {
          Navigator.pushNamed(context, route);
        });
  }
}
