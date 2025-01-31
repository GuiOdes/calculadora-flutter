import 'package:app/dtos/Message.dart';
import 'package:app/services/Back4AppService.dart';
import 'package:flutter/material.dart';
Back4AppService service = Back4AppService();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Mock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatMockScreen(),
    );
  }
}

class ChatMockScreen extends StatefulWidget {
  @override
  _ChatMockScreenState createState() => _ChatMockScreenState();
}

class _ChatMockScreenState extends State<ChatMockScreen> {
  List<Map<String, String>> _messages = [];
  int _currentIndex = 0;
  final int _messagesPerPage = 15;
  bool _isLoading = false;



  // Função para gerar mensagens mockadas
  Future<List<Map<String, String>>> _generateMockMessages(MessageDto message) async {
    if(await service.addMessageToChat(message)){
      return [
        {
          'text': message.content,
          'timestamp': message.createdAt.toString(),
        },
      ];
    }
  }

  // Função para carregar mais mensagens
  Future<void> _loadMoreMessages() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // Simula um delay de 1 segundo para carregar dados
    await Future.delayed(Duration(seconds: 1));
    List<MessageDto> listMessages = await service.getMessagesFromLocalStorage();
    final newMessages = service.addMessageToChat(MessageDto('Olá Mundo', 'gustavo', '10:00'));

    setState(() {
      _messages.insertAll(0, newMessages);
      _currentIndex += _messagesPerPage;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMoreMessages(); // Carrega as primeiras mensagens ao iniciar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Mock'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          // Verifica se o usuário chegou ao topo da lista
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.minScrollExtent && !_isLoading) {
            _loadMoreMessages();
          }
          return true;
        },
        child: ListView.builder(
          reverse: false, // Para o scroll infinito para cima
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            final message = _messages[index];
            return ListTile(
              title: Text(message['text']!),
              subtitle: Text(message['timestamp']!),
            );
          },
        ),
      ),
    );
  }
}