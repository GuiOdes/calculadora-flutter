class Messages{
  Map<String, String> messages = {};
  Map<String, String> addMessage(Map<String, String> list, String message, String username) {
      if (list.containsKey(username)) {
        print("Username already exists");
      } else {
        list[username] = message;
        print("Message added successfully");
      }
      return list;
  }
}