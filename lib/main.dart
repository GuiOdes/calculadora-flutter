import 'package:app/pages/ChatPage.dart';
import 'package:app/ThemeData.dart';
import 'package:app/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const HomePage(),
        '/chat': (context) => const ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
