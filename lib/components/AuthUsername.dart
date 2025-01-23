import 'dart:async';
import 'Message.dart';

class AuthUsername {
  //addUsername method to add username to the list
  Map<String, DateTime> addUsername(Map<String, DateTime> list, String username) {
    if (list.containsKey(username)) {
      print("Username already exists");
    } else {
      final DateTime now = DateTime.now();
      list[username] = now;
      print("Username added successfully at $now");
    }
    return list;
  }
  //remover os usuários que o DateTime for maior que 5 segundos
  Map<String, DateTime> removeUsername(Map<String, DateTime> list) {
    final DateTime now = DateTime.now();
    List<String> keysToRemove = [];
    list.forEach((key, value) {
      if (now.difference(value).inSeconds > 5) {
        keysToRemove.add(key);
        print("removing $key");

      }
    });
    keysToRemove.forEach((key) {
      list.remove(key);
    print("Username $key removed successfully");
    });
    return list;
  }
}

void main () async {
  print("Hello, World!");
  AuthUsername authUsername = AuthUsername();
  Map<String, DateTime> usernames = {};
  usernames = authUsername.addUsername(usernames, "john_doe");
  usernames = authUsername.addUsername(usernames, "jane_doe");
  usernames = authUsername.addUsername(usernames, "john_doe");
  print(usernames);

  //chamar a função para remover os usuários após 5 minutos
  Timer.periodic(Duration(seconds: 10), (timer) {
    usernames = authUsername.removeUsername(usernames);
  });

  usernames = authUsername.addUsername(usernames, "jane_doe");
  usernames = authUsername.addUsername(usernames, "john_doe");
  Messages messages = Messages();
  Map<String, String> messageList = {};
  messageList = messages.addMessage(messageList, "Hello, World!", "john_doe");
  messageList = messages.addMessage(messageList, "Hello, World!", "jane_doe");
  print(messageList);
}
