import 'package:app/ThemeData.dart';
import 'package:app/pages/HomePage.dart';
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
