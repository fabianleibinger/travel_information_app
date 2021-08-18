import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// List Tile, that can open an Alert Dialog.
class DialogListTile extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Widget? dialog;

  DialogListTile({this.title, this.iconData, this.dialog});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(this.iconData),
      title: Text(this.title!),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return this.dialog!;
          },
        );
      },
    );
  }
}
