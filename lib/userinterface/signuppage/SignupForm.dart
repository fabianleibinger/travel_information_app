import 'package:flutter/material.dart';
import 'package:travel_information_app/backend/APIProvider.dart';
import 'package:travel_information_app/models/preferenceservice/user/signup/Signup.dart';
import 'package:travel_information_app/routes/Routes.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  String? _username;
  String? _fullname;
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
            decoration: InputDecoration(labelText: "full name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a full name.";
              }
            },
            onSaved: (value) => _fullname = value,
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
            child: FloatingActionButton.extended(
              onPressed: () => submit(),
              label: Text("submit"),
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
      Future<Map<String, dynamic>> signupResponseJson = apiProvider.httpPost(
        'user/signup',
        new Signup(_username!, _fullname!, _password!).toJson(),
      );
      signupResponseJson.then((value) {
        Navigator.pushReplacementNamed(context, Routes.map);
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to sign up. Username must be an email.')));
      });
    }
  }
}
