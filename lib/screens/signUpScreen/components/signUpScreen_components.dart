import 'package:flutter/material.dart';

TextFormField myCustomTextField(
    {TextEditingController controller, String hintText}) {
  return TextFormField(
    style: TextStyle(
      fontSize: 22.0,
    ),
    controller: controller,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.teal),
      ),
      hintText: hintText,
    ),
    validator: (input) {
      if (input == null) {
        return "invalid input";
      } else {
        return null;
      }
    },
  );
}
