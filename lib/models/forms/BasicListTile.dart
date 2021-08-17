import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// List Tile, that can be used for menus.
class BasicListTile extends StatelessWidget {

  final String? title;
  final IconData? iconData;
  final String? route;

  BasicListTile({this.title, this.iconData, this.route});

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
