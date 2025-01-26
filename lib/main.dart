import 'package:app/pages/ChatPage.dart';
import 'package:app/ThemeData.dart';
import 'package:app/pages/HomePage.dart';
import 'package:app/services/Back4AppService.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'components/MyAppBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Back4AppService service = Back4AppService();

  await service.init();

  var chat = await service.getOrCreateChat();

  print(chat.result);

  print(await service.getMessagesFromChat());

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
