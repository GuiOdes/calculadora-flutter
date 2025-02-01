import 'package:app/ThemeData.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Adicione este parâmetro
  final VoidCallback? onSuffixIconPressed; // Adicione este parâmetro

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validator, // Adicione este parâmetro
    this.onSuffixIconPressed, // Adicione este parâmetro
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: darkMode.btnTextColor,
      style: TextStyle(
        color: darkMode.btnTextColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: darkMode.btnTextColor,
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
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon, color: darkMode.btnTextColor),
          onPressed: onSuffixIconPressed,
        )
            : null,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: darkMode.btnTextColor)
            : null,
      ),
      validator: validator, // Use o parâmetro aqui
    );
  }
}
