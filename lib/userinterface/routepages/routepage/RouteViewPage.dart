import 'package:flutter/material.dart';

import 'RouteViewPageArgument.dart';

class RouteViewPage extends StatelessWidget {
  static const String routeName = "/routeView";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RouteViewPageArgument;

    // TODO: implement build
    throw UnimplementedError();
  }
}
