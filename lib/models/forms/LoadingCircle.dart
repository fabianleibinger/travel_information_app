import 'package:flutter/material.dart';

import '../global.dart';

/// The CircularProgressIndicator for this app.
class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(148, 0, 148, 0),
      child: CircularProgressIndicator(color: lightGreen),
    );
  }
}
