import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/models/messages.dart';
import 'package:flutter/material.dart';

class MessageFirebase {
 ScrollController listViewController = ScrollController();
  TextEditingController messageController = TextEditingController();
  final messageRef = FirebaseFirestore.instance.collection("Messages").withConverter<MessageModel>(
          fromFirestore: (snapshot, _) => MessageModel.fromJson(snapshot.data()!),
        toFirestore: (message, _) => message.toJson());

  addMessage() async {
    try {

      final doc = messageRef.doc();
      MessageModel message = MessageModel(
        name:FirebaseAuth.instance.currentUser!.displayName! ,
        id: doc.id,
        uid: FirebaseAuth.instance.currentUser!.uid,
        message: messageController.text.trim(),

      );

      await doc.set(message).then((value) {
        listViewController.animateTo(
          0,
          curve: Curves.fastOutSlowIn,

          duration: const Duration(milliseconds: 500),
        );
        messageController.clear();
      });
    } on Exception catch (e) {
      // TODO
    }
  }

  Stream<QuerySnapshot<MessageModel>> getAllMessage() {
    return messageRef
        .orderBy(JsonKeyManager.createdAt, descending: true)
        .snapshots();
  }
}