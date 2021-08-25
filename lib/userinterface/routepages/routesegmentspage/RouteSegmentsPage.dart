import 'package:flutter/material.dart';

import 'RouteSegmentsPageArgument.dart';

class RouteSegmentsPage extends StatelessWidget {
  static const String routeName = "/routeSegments";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RouteSegmentsPageArgument;

    return Scaffold();
  }
}
