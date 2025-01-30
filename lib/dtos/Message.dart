import 'dart:convert';

class MessageDto {
  final String content;
  final String userName;
  final DateTime createdAt;

  MessageDto(this.content, this.userName, this.createdAt);
  MessageDto.withId(this.content, this.userName, this.createdAt);

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return MessageDto(
      json['content'],
      json['userName'],
      DateTime.parse(json['createdAt']['iso'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'username': userName,
      'createdAt': createdAt
    };
  }

  static String toJsonArrayString(List<MessageDto> messages) {
    return messages.map((e) => e.toJson()).toList().toString();
  }

  static List<MessageDto> fromJsonArrayString(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => MessageDto.fromJson(json)).toList();
  }

  @override
  String toString() {
    return 'MessageDto{ content: $content, userName: $userName , createdAt: $createdAt }';
  }
}