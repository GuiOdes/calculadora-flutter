import 'package:flutter/material.dart';

final darkMode = CustomThemeData(
  backgroundColor: Colors.black,
  primaryTextColor: Colors.white,
  secondaryTextColor: Colors.grey,
  btnBackgroundColor: Colors.blue,
  btnTextColor: Colors.white,
  appBarBackgroundColor: Colors.black,
  appBarTextColor: Colors.white,
  chatBubbleColor: Colors.grey[800]!,
  chatBubbleTextColor: Colors.white,
  chatBubbleMeColor: Colors.blue,
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

  // constructor
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
