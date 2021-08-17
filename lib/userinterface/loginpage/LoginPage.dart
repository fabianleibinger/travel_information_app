import 'package:flutter/material.dart';
import 'package:travel_information_app/models/forms/FormPage.dart';

import 'LoginForm.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return FormPage(
        title: 'login', iconData: Icons.login_rounded, form: LoginForm());
  }
}
