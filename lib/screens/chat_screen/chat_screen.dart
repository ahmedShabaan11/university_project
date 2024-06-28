import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/chat_bubble_model.dart';
import 'package:university/constants.dart';
import 'package:university/data/firebase/message_firebase.dart';
import 'package:university/data/firebase/private_chat_firebase.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/messages.dart';
import 'package:university/data/models/private_chat_model.dart';
import 'package:university/data/models/user.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  static String chatScreen = "chatScreen";

  @override
  Widget build(BuildContext context) {
    MessageFirebase messageFirebase = MessageFirebase();
    final users =
        ModalRoute.of(context)!.settings.arguments as List<UserModel?>;
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("${users[1]!.firstName } ${users[1]!.lastName}"),),
      backgroundColor: kOtherColor,
      body: StreamBuilder<QuerySnapshot<MessageModel>>(
          stream: messageFirebase.getAllMessage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MessageModel> messagesList = snapshot.data?.docs.where((element) => element.data().chatId!=null)
                      .where((element) =>
                          element
                              .data()
                              .chatId!
                              .contains("${users[0]!.uid}${users[1]!.uid}") ||
                          element
                              .data()
                              .chatId!
                              .contains("${users[1]!.uid}${users[0]!.uid}"))
                      .map((e) {
                    return e.data();
                  }).toList() ??
                  [];
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
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
                    ),
                  ),
                  TextFormField(
                    controller: messageFirebase.messageController,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: Icon(Icons.send),
                          onTap: () async {
                            if (messagesList.isEmpty) {
                              UserFirebase().newConnection(users[0]!, users[1]!);
                            }
                            await messageFirebase.addPrivateMessage(
                                "${users[0]!.uid}${users[1]!.uid}");
                            controller.clear();
                          },
                        ),
                        hintText: "Type ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('loading..'));
            }
          }),
    );
  }
}
