import 'package:flutter/material.dart';

import 'LoginForm.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(50),
              child: Icon(
                Icons.login_rounded,
                size: 100,
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
