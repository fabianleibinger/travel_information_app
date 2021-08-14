import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_information_app/models/global.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer([this._currentPage]);

  final String _currentPage;
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
            child:
            Text("Travel Information App", style: whiteHeader),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                bottom: Divider.createBorderSide(context),
              ),
            ),
          ),
          //Drawer Content
          Expanded(
            child: ListView(
              padding: _listViewPadding,
              children: <Widget>[
                Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
