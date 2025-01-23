import 'package:app/pages/ChatPage.dart';
import 'package:app/ThemeData.dart';
import 'package:app/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

<<<<<<< HEAD
import 'components/MyAppBar.dart';

void main() async {
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
=======
void main() {
>>>>>>> 36ac597e99596a312ede6a88afbbd62d901e458e
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
