import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_information_app/models/global.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer([this.currentPage]);

  final String currentPage;
  final EdgeInsets _drawerHeaderPadding = EdgeInsets.all(16.0);
  final EdgeInsets _listViewPadding = EdgeInsets.fromLTRB(0, 8, 0, 0);

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
            padding: _drawerHeaderPadding,
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
          Expanded(
            child: Scrollbar(
              showTrackOnHover: true,
              radius: Radius.circular(10),
              child: ListView(
                padding: _listViewPadding,
                children: <Widget>[
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
                ],
              ),
            ),
          ),
          Divider(),
          generateTile(context, "Preference Profiles", Icons.mode_edit),
          generateTile(context, "User Profile", Icons.account_circle),
          generateTile(context, "Settings", Icons.settings),
        ],
      ),
    );
  }

  /// Generates a single standard tile for the [ListView] in the [AppDrawer]
  /// [route] to page that shall be opened on tap
  /// [text] shown on tile
  /// [icon] shown to the left of the text on the tile
  ListTile generateTile(BuildContext context, String text, IconData icon) {
    return ListTile(
        //selected: currentDrawer == route ? true : false,
        leading: Icon(icon),
        title: Text(text),
        onTap: () {
          Navigator.pop(context);
        });
  }
}
