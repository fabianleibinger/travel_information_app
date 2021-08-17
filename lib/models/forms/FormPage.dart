import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Widget? form;

  FormPage({this.title, this.iconData, this.form});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(50),
              child: Icon(
                iconData,
                size: 100,
              ),
            ),
            form!,
          ],
        ),
      ),
    );
  }
}
