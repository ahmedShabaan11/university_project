import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/models/messages.dart';
import 'package:flutter/material.dart';

class MessageFirebase {
  ScrollController listViewController = ScrollController();
  TextEditingController messageController = TextEditingController();
  final messageRef = FirebaseFirestore.instance
      .collection("Messages")
      .withConverter<Message>(
          fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
          toFirestore: (message, _) => message.toJson());

  addMessage() async {
    try {
      final doc = messageRef.doc();
      Message message = Message(
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

  Stream<QuerySnapshot<Message>> getAllMessage() {
    return messageRef
        .orderBy(JsonKeyManager.createdAt, descending: true)
        .snapshots();
  }
}
