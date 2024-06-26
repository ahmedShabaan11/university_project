import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:university/data/firebase/private_chat_firebase.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/private_chat_model.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/chat_screen/chat_screen.dart';
import 'package:university/screens/chat_screen/group_chat_screen.dart';
import 'package:university/screens/chat_screen/component/chat_item.dart';
import 'package:university/screens/chat_screen/component/global_search_bar.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  static String chatList = "chatList";

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool isSearch = false;

  void isVisible() {
    isSearch = !isSearch;
    setState(() {});
  }

  UserFirebase userFirebase = UserFirebase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      backgroundColor: kOtherColor,
      body: isSearch
          ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: GlobalSearchBar(
                isVisible: isVisible,
              ),
          )
          : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                children: [
                  InkWell(
                    onTap: isVisible,
                    child: Row(
                      children: [
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                  if (FirebaseAuth.instance.currentUser!.photoURL ==
                      StudentHomeScreen.studentHome)
                    ChatItem(
                      title: "Student Group",
                      type: "",
                      onTap: () {
                        Navigator.pushNamed(context, GroupChat_Screen.id);
                      },
                    ),
                  Expanded(
                      child: StreamBuilder<QuerySnapshot<UserModel>>(
                          stream: userFirebase.getUser(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              UserModel userModel =
                                  snapshot.data!.docs.first.data();
                              return ListView.builder(
                                  itemCount: userModel.connections.length,
                                  itemBuilder: (context, index) {
                                    return ChatItem(
                                      title:
                                          "${userModel.connections[index].firstName} ${userModel.connections[index].lastName}",
                                      type: userModel.connections[index].type,
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ChatScreen.chatScreen,
                                            arguments: [
                                              userModel,
                                              userModel.connections[index]
                                            ]);
                                      },
                                    );
                                  });
                            } else {
                              return const Center(child: Text('loading..'));
                            }
                          }))
                ],
              ),
          ),
    );
  }
}
