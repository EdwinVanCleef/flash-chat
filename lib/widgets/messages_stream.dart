import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({Key? key, required this.currentUser}) : super(key: key);

  final _firestore = FirebaseFirestore.instance;
  final String currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<DocumentSnapshot> messages = snapshot.data!.docs;
          List<MessageBubble> messageWidgets = [];

          for (var message in messages.reversed) {
            String messageText = message['text'].toString();
            String messageEmail = message['sender'].toString();

            final textWidget = MessageBubble(
              message: messageText,
              sender: messageEmail,
              isMe: (currentUser == messageEmail) ? true : false,
            );
            messageWidgets.add(textWidget);
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              children: messageWidgets,
            ),
          );
        }
      },
    );
  }
}
