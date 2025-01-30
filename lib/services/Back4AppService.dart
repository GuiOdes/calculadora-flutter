import 'package:app/dtos/Message.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Back4AppService {
  int messageId = 1;
  int hoursExpiration = 3;

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

  Future<ParseObject?> getOrCreateChat() async {
    final query = QueryBuilder<ParseObject>(ParseObject('Chat'))..setLimit(1);
    final response = await query.query();

    if (response.success && response.results != null && response.results!.isNotEmpty) {
      print('Chat found');
      return response.results!.first;
    }

    print('Chat not found, creating new chat');
    final newChat = ParseObject('Chat');
    final saveResponse = await newChat.save();
    return saveResponse.success ? newChat : null;
  }

  Future<bool> addMessageToChat(MessageDto message) async {
    final chat = await getOrCreateChat();
    if (chat == null) return false;

    var msgToSave = ParseObject('Message')
        ..set('content', message.content)
        ..set('username', message.userName)
        ..set('createdAt', message.createdAt)
        ..set('chat_id', chat.toPointer());

    var saveResponse = await msgToSave.save();

    print(saveResponse.success ? 'Message added to chat' : 'Failed to add message');

    return saveResponse.success;
  }

  Future<List<MessageDto>?> getMessagesFromChat() async {
    final chat = await getOrCreateChat();
    if (chat == null) throw Exception('Chat not found');

    final query = QueryBuilder<ParseObject>(ParseObject('Message'))
      ..whereEqualTo('chat_id', chat.toPointer())
      ..orderByDescending('createdAt');

    final response = await query.query();

    if (response.success && response.results != null) {
      final messages = response.results!.map((message) {
        return MessageDto(
          message.get<String>('content') ?? '',
          message.get<String>('username') ?? '',
          message.get<DateTime>('createdAt') ?? DateTime.now(),
        );
      }).toList();

      return messages;
    }

    return null;
  }
}