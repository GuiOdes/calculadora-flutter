import 'package:app/dtos/Message.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Back4AppService {
  Future<void> init() async {
    await _connectParse();
    print("Connected to Parse");
  }

  Future<void> _connectParse() async {
    const keyApplicationId = '7rfHQzJf2x0pKuy4IfkpNWeDMxdbyIlsrFMqzpac';
    const keyClientKey = 'q77ElNXTxKaXWdriGKvBXIju18gZ2mhOQjJGODtf';
    const keyParseServerUrl = 'https://parseapi.back4app.com';

    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      debug: true,
    );
  }

  Future<ParseResponse> getOrCreateChat() async {
    var query = QueryBuilder<ParseObject>(ParseObject('Chat'))..setLimit(1);
    var chat = await query.query();

    if (chat.success && chat.results != null && chat.results!.isNotEmpty) {
      print('Chat found');
      return chat;
    }

    print('Chat not found, creating new chat');
    var newChat = ParseObject('Chat');

    return newChat.save();
  }

  Future<ParseResponse> addMessageToChat(String message, String userName) async {
    final query = QueryBuilder<ParseObject>(ParseObject('Chat'));
    final response = await query.query();
    var messages = response.results!.first.get<List<dynamic>>('messages') ?? [];
    var messagesDto = messages.map((e) => MessageDto.fromJson(e)).toList();
    var newMessage = MessageDto(message, userName);

    messagesDto.add(newMessage);

    response.results!.first.set('messages', messagesDto.map((e) => e.toJson()).toList());

    print('Adding message to chat');
    return response.results!.first.save();
  }

  Future<List<MessageDto>> getMessagesFromChat() async {
    final query = QueryBuilder<ParseObject>(ParseObject('Chat'));
    final response = await query.query();
    var messages = response.results!.first.get<dynamic>('messages') ?? [];

    print("Messages: $messages");

    var messagesDto = <MessageDto>[];

    print(messagesDto);

    for (var message in messages) {
      if (message is Map<String, dynamic>) {
        messagesDto.add(MessageDto.fromJson(Map<String, dynamic>.from(message)));
        print("Converte");
      } else {
        print("Mensagem inválida: $message");
      }
    }

    print("MessagesDto: $messagesDto");
    print(messagesDto.runtimeType);

    print('Getting messages from chat');

    return messagesDto;
  }

  Future<List<ParseObject>>
}
