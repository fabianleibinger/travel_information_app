import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_information_app/models/forms/FormPage.dart';
import 'package:travel_information_app/userinterface/settingspage/accountpage/AccountForm.dart';

class AccountPage extends StatelessWidget {
  static const String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    return FormPage(
        title: 'account',
        iconData: Icons.account_circle,
        form: AccountForm(
          fullname: 'jeff',
        ));
  }
}
