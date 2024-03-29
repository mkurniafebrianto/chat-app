import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessagesWidget extends StatelessWidget {
  const ChatMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy(
              'createdAt',
              descending: false,
            )
            .snapshots(),
        builder: (context, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text('No messages found.'),
            );
          }

          if (chatSnapshots.hasError) {
            return const Center(
              child: Text('Something went wrong...'),
            );
          }

          final loadedMessage = chatSnapshots.data!.docs;

          return ListView.builder(
            itemCount: loadedMessage.length,
            itemBuilder: (context, index) => Text(
              loadedMessage[index].data()['text'],
            ),
          );
        });
  }
}
