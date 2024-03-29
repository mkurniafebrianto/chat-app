import 'package:chatapp/widgets/chat_messages_widget.dart';
import 'package:chatapp/widgets/new_messages_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            Expanded(
              child: ChatMessagesWidget(),
            ),
            NewMessagesWidget(),
          ],
        ),
      ),
    );
  }
}
