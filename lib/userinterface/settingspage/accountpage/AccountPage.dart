import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/APIProvider.dart';
import 'package:travel_information_app/models/forms/FormPage.dart';
import 'package:travel_information_app/models/forms/LoadingCircle.dart';
import 'package:travel_information_app/models/global.dart';
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
  /// Serves as a placeholder until account information is received.
  Widget _child = LoadingCircle();

  String? _username;
  String? _fullname;
  String? _role;

  @override
  void initState() {
    super.initState();
    this.receiveAccountInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FormPage(
      title: 'account',
      iconData: Icons.account_circle,
      child: this._child,
    );
  }

  /// Requests the account information at the backend server.
  /// Sets values accordingly.
  receiveAccountInfo() {
    APIProvider apiProvider = new APIProvider();
    Map<String, dynamic> requestBody =
        StandardRequest(User().getAccessToken()).toJson();
    Future<Map<String, dynamic>> accountInfoJson =
        apiProvider.httpPost('user/account', requestBody);
    accountInfoJson.then((value) {
      AccountInfo accountInfo = AccountInfo.fromJson(value);
      this._username = accountInfo.username;
      this._fullname = accountInfo.fullname;
      this._role = accountInfo.role;
      this.getChild();
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to receive account info.')));
    });
  }

  /// Returns the child of this widget.
  getChild() {
    setState(() {
      this._child = Column(
        children: [
          ListTile(title: Text(this._username!), subtitle: Text('username')),
          ListTile(title: Text(this._fullname!), subtitle: Text('full name')),
          ListTile(title: Text(this._role!), subtitle: Text('role')),
          Container(
            padding: EdgeInsets.all(30),
            child: FloatingActionButton.extended(
                label: Text('edit account'),
                onPressed: () {
                  setState(() {
                    this._child = Column(
                      children: [
                        AccountForm(fullname: this._fullname!),
                        FloatingActionButton.extended(
                          backgroundColor: red,
                          onPressed: () => this.getChild(),
                          label: Text("back"),
                        ),
                      ],
                    );
                  });
                }),
          ),
        ],
      );
    });
  }
}
