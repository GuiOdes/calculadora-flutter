import 'package:app/ThemeData.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;

  const CustomTextField({
    super.key,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: darkMode.btnTextColor,
      style: TextStyle(
          color: darkMode.btnTextColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: darkMode.btnTextColor
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: darkMode.btnTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: darkMode.btnTextColor,
          ),
        ),
        // icon if exists in suffix
        suffixIcon: Icon(
            icon,
          color: darkMode.btnTextColor,
        ),
      ),
    );
  }
}
