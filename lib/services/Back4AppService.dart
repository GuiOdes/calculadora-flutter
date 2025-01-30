import 'package:app/dtos/Message.dart';
import 'package:localstorage/localstorage.dart';
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

    final messages = chat.get<List<dynamic>>('messages') ?? [];
    final messagesDto = messages.map((e) => MessageDto.fromJson(e)).toList();

    message.id = messageId++;
    messagesDto.add(message);

    chat.set('messages', messagesDto.map((e) => e.toJson()).toList());
    final saveResponse = await chat.save();

    print(saveResponse.success ? 'Message added to chat' : 'Failed to add message');
    return saveResponse.success;
  }

  Future<void> getMessagesFromChatAndSetToLocalStorage() async {
    final chat = await getOrCreateChat();
    if (chat == null) return;

    final messages = chat.get<List<dynamic>>('messages') ?? [];
    final messagesDto = messages
        .whereType<Map<String, dynamic>>()
        .map((e) => MessageDto.fromJson(e))
        .toList();

    print('Fetched ${messagesDto.length} messages from chat');
    localStorage.setItem('messages', MessageDto.toJsonArrayString(messagesDto));
  }

  List<MessageDto> getMessagesFromLocalStorage() {
    deleteMessagesOlderThanXHours();
    final messagesJson = localStorage.getItem('messages') ?? '[]';
    return MessageDto.fromJsonArrayString(messagesJson);
  }

  Future<void> deleteMessagesOlderThanXHours() async {
    final messagesJson = localStorage.getItem('messages') ?? '[]';
    final messagesDto = MessageDto.fromJsonArrayString(messagesJson);

    final now = DateTime.now();

    final filteredMessages = messagesDto.where((message) {
      final difference = now.difference(message.createdAt);
      return difference.inHours <= hoursExpiration;
    }).toList();

    localStorage.setItem('messages', MessageDto.toJsonArrayString(filteredMessages));

    print('Deleted messages older than 3 hours. Remaining messages: ${filteredMessages.length}');
  }
}