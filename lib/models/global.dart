import 'package:flutter/material.dart';

// colors used throughout the app
Color black = Colors.black;
Color blue = Color(0xFF0E2356);
Color green = Color(0xFF007749);
Color grey = Color(0xFF807F84);
Color lightgrey = Color(0xFFDEDEDE);
Color lightGreen = Color(0xFF2FAE7A);
Color red = Color(0xFFBF1E00);
Color white = Colors.white;

// custom text styles used in the app
TextStyle blackText = new TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: black,
    fontSize: 30);

TextStyle lightGreyText = new TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: grey,
    fontSize: 30);

TextStyle smallBlackText =
    new TextStyle(fontFamily: 'Avenir', color: black, fontSize: 20);

TextStyle smallLightGreyText =
    new TextStyle(fontFamily: 'Avenir', color: grey, fontSize: 20);

TextStyle tinyLightGreyText =
    new TextStyle(fontFamily: 'Avenir', color: grey, fontSize: 10);

TextStyle blackDialogHeader = new TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: black,
    fontSize: 30);

TextStyle whiteHeader =
    new TextStyle(fontFamily: 'Avenir', color: white, fontSize: 20);

TextStyle blackHeader = new TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: black,
    fontSize: 30);

TextStyle whiteButtonText = new TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: white,
    fontSize: 30);

TextStyle lightGreyButtonText = new TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: grey,
    fontSize: 30);

TextStyle greenButtonText = new TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: green,
    fontSize: 30);

TextStyle redButtonText = new TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: red,
    fontSize: 30);

/// App theme
ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  appBarTheme:
      AppBarTheme(brightness: Brightness.dark, titleTextStyle: whiteHeader),
  primaryColor: green,
  accentColor: lightGreen,
  errorColor: red,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  toggleableActiveColor: green,
  disabledColor: grey,
  elevatedButtonTheme:
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: green)),
);

/// Dark App Theme
ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(titleTextStyle: whiteHeader),
  primaryColor: green,
  accentColor: lightGreen,
  errorColor: red,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  toggleableActiveColor: green,
  disabledColor: grey,
  elevatedButtonTheme:
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: green)),
);
