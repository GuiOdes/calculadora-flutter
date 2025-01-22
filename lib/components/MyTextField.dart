import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  //final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    //required this.validator,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //validator: validator,
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outlined, color: Colors.white,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
            //style: BorderStyle.solid
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}