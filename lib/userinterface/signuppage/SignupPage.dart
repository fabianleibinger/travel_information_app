import 'package:flutter/material.dart';
import 'package:travel_information_app/models/forms/FormPage.dart';

import 'SignupForm.dart';

class SignupPage extends StatelessWidget {
  static const String routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    return FormPage(
        title: 'sign up', iconData: Icons.logout_rounded, form: SignupForm());
  }
}
