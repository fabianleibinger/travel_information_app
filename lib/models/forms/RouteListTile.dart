import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// List Tile, that can navigate to a Route.
class RouteListTile extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final String? route;

  RouteListTile(
      {@required this.title, @required this.iconData, @required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(this.iconData),
        title: Text(this.title!),
        onTap: () {
          Navigator.pushNamed(context, this.route!);
        });
  }
}
