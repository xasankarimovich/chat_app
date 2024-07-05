import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthServices with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  FirebaseAuthServices() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
