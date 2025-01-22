import 'package:flutter/material.dart';

import '../components/MyAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              )
            ],
          )
      ),
    );;
  }
}