import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/APIProvider.dart';
import 'package:travel_information_app/models/preferenceservice/user/account/AccountPutRequest.dart';
import 'package:travel_information_app/models/user/User.dart';
import 'package:travel_information_app/routes/Routes.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({Key? key}) : super(key: key);

  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _formKey = GlobalKey<FormState>();

  String? fullname;
  String? _password;

  _AccountFormState({this.fullname});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(labelText: "edit full name"),
            initialValue: this.fullname,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a full name.";
              }
            },
            onSaved: (value) => this.fullname = value,
          ),
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(labelText: "password"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a password.";
              }
            },
            onSaved: (value) => _password = value,
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () => submit(),
              child: const Text("submit"),
            ),
          ),
        ],
      ),
    );
  }

  submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      APIProvider apiProvider = new APIProvider();
      Future<Map<String, dynamic>> accountInfoJson = apiProvider.httpPut(
        'user/account',
        new AccountPutRequest(fullname!, _password!, User().getAccessToken())
            .toJson(),
      );
      accountInfoJson.then((value) {
        Navigator.pushReplacementNamed(context, Routes.map);
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to edit account info.')));
      });
    }
  }
}
