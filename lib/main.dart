import 'package:flutter/material.dart';
import 'package:travel_information_app/models/global.dart';
import 'package:travel_information_app/userinterface/mappage/MapPage.dart';

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
    );
  }
}
