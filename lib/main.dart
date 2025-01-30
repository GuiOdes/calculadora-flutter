import 'package:app/pages/ChatPage.dart';
import 'package:app/pages/HomePage.dart';
import 'package:app/services/Back4AppService.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  Back4AppService service = Back4AppService();

  await service.init();

  await service.getMessagesFromChatAndSetToLocalStorage();

  print('Messages from local storage: ${localStorage.getItem('messages')}');

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
