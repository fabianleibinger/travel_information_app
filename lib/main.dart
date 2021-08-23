import 'package:flutter/material.dart';
import 'package:travel_information_app/models/theme/global.dart';
import 'package:travel_information_app/routes/Routes.dart';
import 'package:travel_information_app/userinterface/UserProfilePage/UserProfilePage.dart';
import 'package:travel_information_app/userinterface/loginpage/LoginPage.dart';
import 'package:travel_information_app/userinterface/mappage/MapPage.dart';
import 'package:travel_information_app/userinterface/preferenceprofilespage/PreferenceProfilesPage.dart';
import 'package:travel_information_app/userinterface/settingspage/SettingsPage.dart';
import 'package:travel_information_app/userinterface/settingspage/accountpage/AccountPage.dart';
import 'package:travel_information_app/userinterface/signuppage/SignUpPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Information App',
      theme: themeData,
      darkTheme: darkThemeData,
      home: MapPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.account:
            return MaterialPageRoute(builder: (context) => AccountPage());
          case Routes.login:
            return MaterialPageRoute(builder: (context) => LoginPage());
          case Routes.map:
            return MaterialPageRoute(builder: (context) => MapPage());
          case Routes.preferenceProfiles:
            return MaterialPageRoute(
                builder: (context) => PreferenceProfilesPage());
          case Routes.settings:
            return MaterialPageRoute(builder: (context) => SettingsPage());
          case Routes.signup:
            return MaterialPageRoute(builder: (context) => SignupPage());
          case Routes.userProfile:
            return MaterialPageRoute(builder: (context) => UserProfilePage());
        }
      },
    );
  }
}
