import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.message, required this.isMe});

  final String sender;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: isMe ? BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ) : BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                message,
                style: isMe ? TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ) : TextStyle(
                  color: Colors.black38,
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
          Text(
              sender,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0,
            )
          ),
        ],
      ),
    );
  }
}
