// import 'dart:js_interop';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
//
// import 'package:chat_app/data/controller/contact_controller.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// class ChatFirebaseServices{
//   Future<void> sendMessage({
//     required String recieverId,
//
// })async{
//    final  currentUser = FirebaseAuth.instance.currentUser;
//    final  chatRoom = getChatRoomId(currentUser!.uid,recieverId);
//
//
//    _chat.doc(chatRoom).collection('messages').add({
//      "text":messages,
//      "sender":currentUser.uid
//    });
//
//   }
// }