import 'package:flutter/material.dart';

final darkMode = CustomThemeData(
  backgroundColor: Color(0xFF121212),
  primaryTextColor: Colors.white,
  secondaryTextColor: Color.fromRGBO(255, 255, 255, 0.7),
  btnBackgroundColor: Color.fromRGBO(255, 255, 255, 0.16),
  btnTextColor: Colors.white,
  appBarBackgroundColor: Color(0xFF121212),
  appBarTextColor: Colors.white,
  chatBubbleColor: Color(0xFF0a3d56),
  chatBubbleTextColor: Colors.white,
  chatBubbleMeColor: Color(0xFF300764),
  chatBubbleMeTextColor: Colors.white,
);

class CustomThemeData {
  final Color backgroundColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color btnBackgroundColor;
  final Color btnTextColor;
  final Color appBarBackgroundColor;
  final Color appBarTextColor;
  final Color chatBubbleColor;
  final Color chatBubbleTextColor;
  final Color chatBubbleMeColor;
  final Color chatBubbleMeTextColor;

  CustomThemeData({
    required this.backgroundColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.btnBackgroundColor,
    required this.btnTextColor,
    required this.appBarBackgroundColor,
    required this.appBarTextColor,
    this.chatBubbleColor = Colors.grey,
    this.chatBubbleTextColor = Colors.black,
    this.chatBubbleMeColor = Colors.blue,
    this.chatBubbleMeTextColor = Colors.white,
  });
}
