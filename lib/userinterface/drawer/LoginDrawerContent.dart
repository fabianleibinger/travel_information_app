import 'package:flutter/material.dart';
import 'package:travel_information_app/userinterface/drawer/AppDrawer.dart';

class LoginDrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: AppDrawer.listViewPadding,
        children: [
          AppDrawer.generateTile(context, "Login", Icons.login_rounded),
          AppDrawer.generateTile(
              context, "Signup", Icons.verified_user_outlined),
          AppDrawer.generateTile(context, "Settings", Icons.settings),
        ],
      ),
    );
  }
}
