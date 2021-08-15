import 'package:flutter/material.dart';

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
            AppDrawer.generateTile(
                context, "Preference Profiles", Icons.mode_edit),
            AppDrawer.generateTile(
                context, "User Profile", Icons.account_circle),
            AppDrawer.generateTile(context, "Settings", Icons.settings),
          ],
        ),
      ),
    );
  }
}
