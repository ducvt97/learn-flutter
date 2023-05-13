import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  Widget _buildCenterWithText(String text) => Center(child: Text(text));

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .orderBy(
            'createAt',
            descending: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return _buildCenterWithText('No messages found.');
        }
        if (snapshot.hasError) {
          return _buildCenterWithText('Some errors occur.');
        }
        final loadedMessages = snapshot.data!.docs;
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final chatMsg = loadedMessages[index].data();
            final nextChatMsg = index + 1 < loadedMessages.length
                ? loadedMessages[index + 1].data()
                : null;
            final currentMsgUserId = chatMsg['userId'];
            final nextMsgUserId =
                nextChatMsg != null ? nextChatMsg['userId'] : null;
            final nextUserIsSame = nextMsgUserId == currentMsgUserId;

            if (nextUserIsSame) {
              return MessageBubble.next(
                message: chatMsg['text'],
                isMe: authUser!.uid == currentMsgUserId,
              );
            }
            return MessageBubble.first(
              userImage: chatMsg['userImage'],
              username: chatMsg['username'],
              message: chatMsg['text'],
              isMe: authUser!.uid == currentMsgUserId,
            );
          },
          itemCount: loadedMessages.length,
          reverse: true,
        );
      },
    );
  }
}
