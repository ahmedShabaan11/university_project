import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/firebase/message_firebase.dart';
import 'package:university/data/models/private_chat_model.dart';
import 'package:university/data/models/user.dart';

class PrivateChatFirebase {
  final privateChatRef = FirebaseFirestore.instance
      .collection("PrivateChat")
      .withConverter<PrivateChatModel>(
          fromFirestore: (snapshot, _) =>
              PrivateChatModel.fromJson(snapshot.data()!),
          toFirestore: (privateChat, _) => privateChat.toJson());

  // createPrivateChat(UserModel to, String message) async {
  //   final doc = privateChatRef.doc();
  //   await doc
  //       .set(PrivateChatModel(
  //     id: doc.id,
  //     from: FirebaseAuth.instance.currentUser!.uid,
  //     to: to.uid!,
  //     name: "${to.firstName} ${to.lastName}",
  //     type: to.type,
  //   ))
  //       .then((value) {
  //     MessageFirebase().addPrivateMessage(doc.id, message);
  //   });
  // }

  Future<String?> getLastPrivateChatId() async{
    String? chatId;
    await privateChatRef.orderBy(JsonKeyManager.createdAt,descending: true).limit(1).get().then((value) {
      chatId = value.docs.last.data().id;
    });
    return chatId;
  }

  getAllPrivateChat() {
   return privateChatRef
        .snapshots();
  }
}
