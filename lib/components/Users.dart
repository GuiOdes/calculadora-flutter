
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Chat{
  // Função para verificar e salvar usuário
  Future<ParseObject?> checkAndSaveUser(String username) async {
    // Recupera ou cria um objeto Chat
    final ParseObject chat = await getOrCreateChat();

    // Verifica se o usuário já está armazenado
    final List<dynamic> users = chat.get<List<dynamic>>('users') ?? [];
    final bool userExists = users.any((user) => user['username'] == username);

    if (userExists) {
      print('User already exists in chat.');
      return null;
    } else {
      // Adiciona o usuário ao objeto Chat
      final Map<String, dynamic> newUser = {'username': username};
      users.add(newUser);
      chat.set('users', users);

      // Salva o objeto Chat atualizado
      return await saveChat(chat);
    }
  }

// Função para criar um novo usuário
  Future<Map<String, dynamic>> createUser(String username) async {
    final Map<String, dynamic> user = {'username': username};
    return user;
  }

// Função para recuperar ou criar um objeto Chat
  Future<ParseObject> getOrCreateChat() async {
    final QueryBuilder<ParseObject> queryChat = QueryBuilder<ParseObject>(ParseObject('Chat'));
    final ParseResponse chatResponse = await queryChat.query();

    ParseObject chat;
    if (chatResponse.success && chatResponse.results != null && chatResponse.results!.isNotEmpty) {
      chat = chatResponse.results!.first;
    } else {
      chat = ParseObject('Chat')
        ..set('users', <Map<String, dynamic>>[])  // Inicializando como lista de mapas
        ..set('messages', <Map<String, dynamic>>[]);  // Inicializando como lista de mapas
    }

    return chat;
  }


// Função para salvar o objeto Chat atualizado
  Future<ParseObject?> saveChat(ParseObject chat) async {
    print('Saving chat: ${chat.toString()}');

    final ParseResponse chatSaveResponse = await chat.save();

    if (chatSaveResponse.success) {
      print('Chat saved successfully!');
      return chat;
    } else {
      print('Failed to save chat: ${chatSaveResponse.error?.message}');
      return null;
    }
  }

}



