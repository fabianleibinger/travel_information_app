import 'package:flutter/cupertino.dart';

class PanelData {
  bool expanded;
  Widget header;
  Widget body;

  PanelData({this.expanded = false, required this.header, required this.body});
}
