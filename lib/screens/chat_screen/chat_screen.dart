import 'dart:html';

import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university/screens/chat_screen/chat_layout.dart';
import '../../componenets/chat_bubble_model.dart';

class Chat_Screen extends StatelessWidget {
  Chat_Screen({super.key});

  TextEditingController controller = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapshot) {
          snapshot.data;
          if (snapshot.hasError) { return ChatLayout();

          }else {const Text('Loading....');}

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

        });
  }
}
