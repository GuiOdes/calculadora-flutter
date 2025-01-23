import 'package:app/RyanThemeData.dart';
import 'package:app/pages/RyanHomePage.dart';
import 'package:flutter/material.dart';

import 'components/MyAppBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mytheme,
      home: const HomePage(),
    );
  }
}
