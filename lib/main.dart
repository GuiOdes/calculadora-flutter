import 'package:app/ThemeData.dart';
import 'package:app/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'components/MyAppBar.dart';

void main() async {
  runApp(const MyApp());
  const keyApplicationId = 'QdZED23aJMjxCSyFLgNucNmsq4lCrhJTBOFfY10e';
  const keyClientKey = 'z3nz8OnTPVqECG5gXQuWRa8xUiOEhJZYOGB8XoGQ';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    autoSendSessionId: true,
    debug: true,
  );

  runApp(MyApp());
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
