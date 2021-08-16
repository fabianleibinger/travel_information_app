import 'package:flutter/material.dart';
import 'package:travel_information_app/userinterface/drawer/AppDrawer.dart';

class LoginDrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: AppDrawer.listViewPadding,
        children: [
          AppDrawer.generateTile(context, "login", Icons.login_rounded),
          AppDrawer.generateTile(
              context, "signup", Icons.verified_user_outlined),
          AppDrawer.generateTile(context, "settings", Icons.settings),
        ],
      ),
    );
  }
}
