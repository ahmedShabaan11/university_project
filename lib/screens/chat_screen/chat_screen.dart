import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../componenets/chat_bubble_model.dart';
import '../../models/messages.dart';

class Chat_Screen extends StatelessWidget {
  Chat_Screen({super.key});

  TextEditingController controller = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for(int i=0 ;i<snapshot.data!.docs.length; i++){
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
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
                    const Text('Chat'),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                     itemCount:  messagesList.length,
                      itemBuilder: (context, index) {
                        return  Caht_Bubble(message: messagesList[index],);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add(
                          {
                            'message': data,
                          },
                        );
                        controller.clear();
                      },
                      decoration: InputDecoration(
                        hintText: 'Sent Message',
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.send,
                          color: Colors.white,
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
              ),
              backgroundColor: kContainerColor);
        }
        else {
          return Text('loading..');
        }
      },
    );
  }
}
