import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/chat_bubble_model.dart';
import 'package:university/constants.dart';
import 'package:university/data/firebase/message_firebase.dart';
import 'package:university/data/firebase/private_chat_firebase.dart';
import 'package:university/data/models/messages.dart';
import 'package:university/data/models/private_chat_model.dart';
import 'package:university/data/models/user.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String chatScreen="chatScreen";
  @override
  Widget build(BuildContext context) {
    MessageFirebase messageFirebase=MessageFirebase();
    String chatId = ModalRoute.of(context)!.settings.arguments as String;
    final controller = TextEditingController();
    return Scaffold(
      backgroundColor: kOtherColor,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<MessageModel>>(
                stream: messageFirebase.getAllPrivateMessage(chatId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MessageModel> messagesList =
                        snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                    return ListView.builder(
                                        reverse: true,
                                        controller: messageFirebase.listViewController,
                                        itemCount: messagesList.length,
                                        itemBuilder: (context, index) {
                    if (FirebaseAuth.instance.currentUser!.uid ==
                        messagesList[index].uid) {
                      return Caht_Bubble(
                        message: messagesList[index],
                      );
                    }
                    return Caht_Bubble_re(
                      message: messagesList[index],
                    );
                                        },
                                      );
                  }else{
                    return const Center(child: Text('loading..'));
                  }
                }),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                        child: Icon(Icons.send),
                        onTap: () async {
                          await MessageFirebase()
                              .addPrivateMessage(chatId, controller.text);
                        },
                      ),
                hintText: "Type ...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )),
          )
        ],
      ),
    );
  }
}
