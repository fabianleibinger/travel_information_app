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
        title: Text(this.title!),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(50),
              child: Icon(
                this.iconData,
                size: 100,
              ),
            ),
            this.form!,
          ],
        ),
      ),
    );
  }
}
