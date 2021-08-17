import 'package:flutter/material.dart';
import 'package:travel_information_app/client/APIProvider.dart';
import 'package:travel_information_app/models/preferenceservice/user/login/LoginRequest.dart';
import 'package:travel_information_app/models/preferenceservice/user/login/LoginResponse.dart';
import 'package:travel_information_app/models/user/User.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(labelText: "username"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a username.";
              }
            },
            onSaved: (value) => _username = value,
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
      Future<Map<String, dynamic>> loginResponseJson = apiProvider.httpPost(
          "user/login",
          new LoginRequest(_username!, _password!).toJson(),
          "Failed to login.");
      loginResponseJson.then((value) {
        LoginResponse response = LoginResponse.fromJson(value);
        User user = User();
        user.setAccessToken(response.accessToken);
      }).onError((error, stackTrace) => null);
    }
  }
}
