import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Message>> getMessages(String chatId) {
    return _firestore
        .collection('chats/$chatId/messages')
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Message.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> sendMessage(String chatId, String text) async {
    await _firestore.collection('chats/$chatId/messages').add({
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}

class Message {
  final String text;
  final DateTime timestamp;

  Message({required this.text, required this.timestamp});

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}
