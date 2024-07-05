import 'package:flutter/material.dart';

import '../../data/controller/contact_controller.dart';


class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: dummyContacts.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(dummyContacts[i].imageUrl),
            ),
            title: Text(dummyContacts[i].name),
            subtitle: Text(dummyContacts[i].lastMessage),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/chat',
                arguments: dummyContacts[i].id,
              );
            },
          );
        },
      ),
    );
  }
}
