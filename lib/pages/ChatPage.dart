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

  void onSendMessage(String message) {
    service.addMessageToChat(
      MessageDto(message, localStorage.getItem('username')!, DateTime.now())
    );

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
              // list view of messages
              Expanded(
                child: ListView(
                  children: [
                    // ChatBubbleListTile(message: "Olá", isSentByMe: true, time: "10:19",),
                    // ChatBubbleListTile(message: "Eae", isSentByMe: false, userName: "Pedrinho", time: "10,19",),
                    // ChatBubbleListTile(message: "Tudo bem?", isSentByMe: true, time: "10:19",),
                    // ChatBubbleListTile(message: "Tudo sim e você?", isSentByMe: false, userName: "Pedrinho", time: "10:19",),
                    // ChatBubbleListTile(message: "Tudo bem também", isSentByMe: true, time: "10:19",),
                    // ChatBubbleListTile(message: "Que bom", isSentByMe: false, userName: "Pedrinho", time: "10:19",),
                    // ChatBubbleListTile(message: "Vamos sair hoje?", isSentByMe: true, time: "10:19",),
                    // ChatBubbleListTile(message: "Vamos sim", isSentByMe: false, userName: "Pedrinho", time: "10:19",),
                    // ChatBubbleListTile(message: "Que horas?", isSentByMe: true, time: "10:19",),
                    // ChatBubbleListTile(message: "Às 20h", isSentByMe: false, userName: "Pedrinho", time: "10:19",),
                    // ChatBubbleListTile(message: "Ok", isSentByMe: true, time: "10:19",),
                  ],
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
