import 'package:app/ThemeData.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController controller;
  

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
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
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: darkMode.btnTextColor,
          ),
        ),
        // icon if exists in suffix
        suffixIcon: suffixIcon != null ? Icon(
          suffixIcon,
          color: darkMode.btnTextColor,
        ) : null,
        prefixIcon: prefixIcon != null ? Icon(
          prefixIcon,
          color: darkMode.btnTextColor,
        ) : null,
      ),
    );
  }
}
