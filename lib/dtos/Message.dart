class MessageDto {
  final String content;
  final String userName;

  MessageDto(this.content, this.userName);

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    return MessageDto(
      json['content'],
      json['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'userName': userName,
    };
  }

  @override
  String toString() {
    return 'MessageDto{content: $content, userName: $userName}';
  }
}