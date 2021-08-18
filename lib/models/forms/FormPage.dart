import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Widget? child;

  FormPage({@required this.title, @required this.iconData, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title!),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Container(
            padding: EdgeInsets.all(50),
            child: Icon(
              this.iconData,
              size: 100,
            ),
          ),
          this.child!,
        ],
      ),
    );
  }
}
