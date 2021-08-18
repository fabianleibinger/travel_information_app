import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/APIProvider.dart';
import 'package:travel_information_app/models/forms/FormPage.dart';
import 'package:travel_information_app/models/preferenceservice/StandardRequest.dart';
import 'package:travel_information_app/models/preferenceservice/user/account/AccountInfo.dart';
import 'package:travel_information_app/userinterface/settingspage/accountpage/AccountForm.dart';
import 'package:travel_information_app/models/user/User.dart';

class AccountPage extends StatefulWidget {
  static const String routeName = "/account";

  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String username = 'jeff';
  String fullname = 'jeff';
  String role = 'jeff';

  @override
  void initState() {
    APIProvider apiProvider = new APIProvider();
    Map<String, dynamic> requestBody =
        StandardRequest(User().getAccessToken()).toJson();
    Future<Map<String, dynamic>> accountInfoJson =
        apiProvider.httpPost('user/account', requestBody);
    accountInfoJson
        .then((value) {
          AccountInfo accountInfo = AccountInfo.fromJson(value);
          this.username = accountInfo.username;
          this.fullname = accountInfo.fullname;
          this.role = accountInfo.role;
        })
        .onError((error, stackTrace) => null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormPage(
      title: 'account',
      iconData: Icons.account_circle,
      child: Column(
        children: [
          ListTile(title: Text(this.username), subtitle: Text('username')),
          ListTile(title: Text(this.fullname), subtitle: Text('full name')),
          ListTile(title: Text(this.role), subtitle: Text('role')),
        ],
      ),
    );
    return FormPage(
      title: 'account',
      iconData: Icons.account_circle,
      child: AccountForm(
        fullname: 'jeff',
      ),
    );
  }
}
