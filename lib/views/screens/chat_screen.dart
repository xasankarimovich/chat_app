import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth_provider/message_provider.dart';

class ChatScreen extends StatelessWidget {
  final String chatId;
  final TextEditingController _messageController = TextEditingController();

  ChatScreen({required this.chatId});

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: messageProvider.getMessages(chatId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      title: Text(message.text),
                      subtitle: Text(message.timestamp.toString()),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: 'Enter a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    messageProvider.sendMessage(chatId, _messageController.text);
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
