import 'package:flutter/material.dart';
import 'package:travel_information_app/models/global.dart';

class LocationSearchField extends StatelessWidget {
  final double _borderRadius = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.3),
            blurRadius: 2,
          )
        ],
      ),
      child: TextField(
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: "search location",
          filled: true,
          fillColor: white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
