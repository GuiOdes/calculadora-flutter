import 'package:flutter/material.dart';

final ThemeData mytheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xff1E1E1E),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff1E1E1E),
  ),
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.normal,
    ),
    headlineLarge: TextStyle(
        color: Colors.white
      )
  ),
);