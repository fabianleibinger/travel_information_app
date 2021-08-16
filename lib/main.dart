import 'package:flutter/material.dart';
import 'package:travel_information_app/models/global.dart';
import 'package:travel_information_app/routes/Routes.dart';
import 'package:travel_information_app/userinterface/mappage/MapPage.dart';
import 'package:travel_information_app/userinterface/signuppage/SignUpPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Information App',
      theme: themeData,
      darkTheme: darkThemeData,
      home: MapPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.signup:
            return MaterialPageRoute(builder: (context) => SignupPage());
        }
      },
    );
  }
}
