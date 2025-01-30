import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:app/services/Back4AppService.dart';
import 'package:app/dtos/Message.dart';
import 'package:intl/intl.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Back4AppService _back4AppService = Back4AppService();

  await _back4AppService.init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageDto> messages = [];
  int page = 0;
  bool isLoading = false;
  bool hasMore = true;
  ScrollController _scrollController = ScrollController();
  Back4AppService back4AppService = Back4AppService();

  @override
  void initState() {
    super.initState();
    _initializeBack4App();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _initializeBack4App() async {
    await back4AppService.init();
    _loadMessages();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.minScrollExtent && !isLoading && hasMore) {
      _loadMessages();
    }
  }

  Future<void> _loadMessages() async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    // Carrega as mensagens do Back4App
    final newMessages = await back4AppService.getMessagesFromChat(12, page);

    setState(() {
      if (newMessages != null && newMessages.isNotEmpty) {
        messages.insertAll(page * 12, newMessages); // Adiciona as novas mensagens no início da lista
        page++;
      } else {
        hasMore = false; // Não há mais mensagens para carregar
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        reverse: true, // Para rolar de baixo para cima
        itemCount: messages.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < messages.length) {
            final message = messages[index];
            return ListTile(
              title: Text(message.userName),
              subtitle: Text(message.content),
              trailing: Text(
                '${message.createdAt.hour}:${message.createdAt.minute}',
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}