import 'package:flutter/material.dart';

Widget textFormField(
  controller,
  String labelText,
  IconData icon,
  Function validator
  
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    validator: (value)=>validator(value),
  );
}
