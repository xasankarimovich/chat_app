import 'package:chat_app/views/screens/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth_provider/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<FirebaseAuthServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authProvider.signOut();
            },
          ),
        ],
      ),
      body: ContactsScreen()
    );
  }
}
