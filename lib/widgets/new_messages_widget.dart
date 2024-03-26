import 'package:flutter/material.dart';

class NewMessagesWidget extends StatefulWidget {
  const NewMessagesWidget({super.key});

  @override
  State<NewMessagesWidget> createState() => _NewMessagesWidgetState();
}

class _NewMessagesWidgetState extends State<NewMessagesWidget> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() {
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    // send to Firebase

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: const InputDecoration(labelText: 'Send a message...'),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          color: Theme.of(context).colorScheme.primary,
          onPressed: _submitMessage,
        )
      ],
    );
  }
}
