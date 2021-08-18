import 'package:flutter/material.dart';
import 'package:travel_information_app/models/global.dart';
import 'package:travel_information_app/models/user/User.dart';
import 'package:travel_information_app/routes/Routes.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Would you like to log out?'),
      actions: [
        TextButton(
          style: TextButton.styleFrom(primary: red),
          onPressed: () => Navigator.pop(context),
          child: Text('go back'),
        ),
        TextButton(
          style: TextButton.styleFrom(primary: lightGreen),
          onPressed: () {
            User().logout();
            Navigator.pushReplacementNamed(context, Routes.map);
          },
          child: Text('yes'),
        ),
      ],
    );
  }
}
