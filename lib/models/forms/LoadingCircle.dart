import 'package:flutter/material.dart';

import '../global.dart';

/// The CircularProgressIndicator for this app.
/// Left, top, right and bottom padding have to be specified.
class LoadingCircle extends StatelessWidget {
  final double? leftPadding;
  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;

  LoadingCircle(
      {@required this.leftPadding,
      @required this.rightPadding,
      @required this.topPadding,
      @required this.bottomPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        this.leftPadding!,
        this.topPadding!,
        this.rightPadding!,
        this.bottomPadding!,
      ),
      child: CircularProgressIndicator(color: lightGreen),
    );
  }
}
