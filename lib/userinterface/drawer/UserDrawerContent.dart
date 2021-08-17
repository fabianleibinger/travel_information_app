import 'package:flutter/material.dart';
import 'package:travel_information_app/routes/Routes.dart';

import 'AppDrawer.dart';

class UserDrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        showTrackOnHover: true,
        radius: Radius.circular(10),
        child: ListView(
          padding: AppDrawer.listViewPadding,
          children: [
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            ListTile(leading: Icon(Icons.map_outlined), title: Text("first")),
            Divider(),
            AppDrawer.generateTile(context, "Preference Profiles",
                Icons.mode_edit, Routes.preferenceProfiles),
            AppDrawer.generateTile(
                context, "User Profile", Icons.account_circle, Routes.userProfile),
            AppDrawer.generateTile(
                context, "Settings", Icons.settings, Routes.settings),
            //TODO replace route by (Dialog)
            AppDrawer.generateTile(
                context, "Logout", Icons.logout_rounded, Routes.settings),
          ],
        ),
      ),
    );
  }
}
