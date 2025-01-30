class MessageDto {
  int? id;
  final String content;
  final String userName;
  final DateTime createdAt;

  MessageDto(this.content, this.userName, this.createdAt);
  MessageDto.withId(this.id, this.content, this.userName, this.createdAt);

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return MessageDto.withId(
      json['id'],
      json['content'],
      json['userName'],
      DateTime.parse(json['createdAt']['iso'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'userName': userName,
      'createdAt': createdAt
    };
  }

  static String toJsonArrayString(List<MessageDto> messages) {
    return messages.map((e) => e.toJson()).toList().toString();
  }

  static List<MessageDto> fromJsonArrayString(String json) {
    return json.split(',').map((e) => MessageDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  String toString() {
    return 'MessageDto{ id: $id, content: $content, userName: $userName , createdAt: $createdAt }';
  }
}