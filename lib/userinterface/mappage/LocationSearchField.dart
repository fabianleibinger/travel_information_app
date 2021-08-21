import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_information_app/models/global.dart';

/// A Text field for entering locations.
class LocationSearchField extends StatelessWidget {
  final String? labelText;

  final double _borderRadius = 30;

  LocationSearchField({@required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 5),
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
      child: TextFormField(
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'\d+(,\d+)?\s\d+(,\d+)?'))
        ],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: this.labelText,
          filled: true,
          fillColor: white.withOpacity(0.9),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
              borderSide: BorderSide.none),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter latitude and longitude.";
          }
        },
        onSaved: (value) {},
      ),
    );
  }
}
