import 'package:flutter/material.dart';

import 'RoutesPageArgument.dart';

class RoutesPage extends StatelessWidget {
  static const String routeName = "/routes";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RoutesPageArgument;

    // TODO: implement build
    throw UnimplementedError();
  }
}
