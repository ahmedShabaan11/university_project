import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:university/core/key_manager.dart';
import 'package:university/data/firebase/message_firebase.dart';
import 'package:university/data/models/messages.dart';
import '../../componenets/chat_bubble_model.dart';

class GroupChat_Screen extends StatelessWidget {
  GroupChat_Screen({super.key,});

static String id="groupChat";


MessageFirebase messageFirebase=MessageFirebase();
     @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/scholar.png',
                height: 50,
              ),
              const Text('Student Group'),
            ],
          ),
        ),
        body: StreamBuilder<QuerySnapshot<MessageModel>>(
          stream: messageFirebase.getAllMessage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MessageModel> messagesList = snapshot.data?.docs.where((element) => element.data().chatId==null)

                  .map((e) => e.data()).toList() ?? [];
             
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: messageFirebase.listViewController,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        if(FirebaseAuth.instance.currentUser!.uid==messagesList[index].uid){
                          return Caht_Bubble(
                            message: messagesList[index],
                          );
                        }
                        return Caht_Bubble_re(message:  messagesList[index],);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: messageFirebase.messageController,
                      onSubmitted: (data) {
                        messageFirebase.addMessage();

                      },
                      decoration: InputDecoration(
                        hintText: 'Sent Message',
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: InkWell(
                          onTap: () {
                            messageFirebase.addMessage();
                          },
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: kPrimaryColor)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('loading..'));
            }
          },
        ),
        backgroundColor: kOtherColor);
  }
}
