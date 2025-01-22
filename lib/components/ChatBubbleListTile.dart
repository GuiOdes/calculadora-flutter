import 'package:app/ThemeData.dart';
import 'package:flutter/material.dart';

class ChatBubbleListTile extends StatelessWidget {
  final String message;
  final String? userName;
  final bool isSentByMe;
  final String time;

  const ChatBubbleListTile({
    super.key,
    required this.message,
    required this.isSentByMe,
    required this.time,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      widthFactor: 0.9,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSentByMe ? darkMode.chatBubbleMeColor : darkMode.chatBubbleColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isSentByMe ? Radius.circular(15) : Radius.circular(0),
            bottomRight: isSentByMe ? Radius.circular(0) : Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                userName ?? 'Eu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSentByMe ? darkMode.chatBubbleMeTextColor : darkMode.chatBubbleTextColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isSentByMe ? darkMode.chatBubbleMeTextColor : darkMode.chatBubbleTextColor,
                    ),
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: isSentByMe ? darkMode.chatBubbleMeTextColor : darkMode.chatBubbleTextColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
