import 'package:app/ThemeData.dart';
import 'package:app/components/ChatBubbleListTile.dart';
import 'package:app/components/CustomTextField.dart';
import 'package:app/dtos/Message.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../components/MyAppBar.dart';
import '../services/Back4AppService.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var service = Back4AppService();

  // Listagem de mensagens
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
    _loadMessages(initialLoad: true);
  }

  void _onScroll() {
    if (_scrollController.position.pixels < _scrollController.position.minScrollExtent - 50 && !isLoading && hasMore) {
      _loadMessages();
    }
  }

  Future<void> _loadMessages({bool initialLoad = false}) async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    final newMessages = await back4AppService.getMessagesFromChat(12, page);

    setState(() {
      if (newMessages != null && newMessages.isNotEmpty) {
        for (var message in newMessages) {
          message.createdAt = message.createdAt.toLocal();
        }
        messages.insertAll(initialLoad ? page * 12 : 0, newMessages);
        page++;
      } else {
        hasMore = false;
      }
      isLoading = false;
    });
  }

  void onSendMessage(String message) {
    if (message.trim().isEmpty) return;

    final newMessage = MessageDto(
      message,
      localStorage.getItem('username')!,
      DateTime.now(),
    );

    service.addMessageToChat(newMessage);

    setState(() {
      messages.insert(0, newMessage);
    });

    messageController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Drawer(
        backgroundColor: Colors.white,
      ),
      backgroundColor: darkMode.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await _loadMessages(initialLoad: true);
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return ChatBubbleListTile(
                        message: message.content,
                        isSentByMe: message.userName == localStorage.getItem('username'),
                        userName: message.userName,
                        time: '${message.createdAt.hour}:${message.createdAt.minute.toString().padLeft(2, '0')}',
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 5),
              Form(
                key: _formKey,
                child: CustomTextField(
                  label: 'Digite sua mensagem...',
                  suffixIcon: Icons.send,
                  controller: messageController,
                  onSuffixIconPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      onSendMessage(messageController.text);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
