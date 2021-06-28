import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/components/messageBubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore _fireStore = FirebaseFirestore.instance;
var _currentUser = FirebaseAuth.instance.currentUser;

class MessageBubbleStream extends StatelessWidget {
  const MessageBubbleStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageBubble> messagesList = [];
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages){
            Map<String, dynamic> messageData = message.data() as Map<String, dynamic>;
            final messageSender = messageData['sender'];
            final messageReceived = messageData['textmessage'];
            final loggedInUser = _currentUser!.email;
            final messageToShow = MessageBubble(
                sender: messageSender ,
                message: messageReceived,
                isMe: loggedInUser == messageSender,
            );
            messagesList.add(messageToShow);
          }
          return Expanded(
            child:ListView(
              reverse: true,
              children: messagesList,
            ),
          );
        }
        return Column();
      },
    );
  }
}
