import 'package:flutter/cupertino.dart';

class SegmentPanelData {
  bool expanded;
  Widget header;
  Widget body;

  SegmentPanelData({this.expanded = false, required this.header, required this.body});
}
