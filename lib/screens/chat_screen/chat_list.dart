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
  PrivateChatFirebase privateChatFirebase=PrivateChatFirebase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      backgroundColor: kOtherColor,
      body: isSearch
          ? GlobalSearchBar(
        isVisible: isVisible,
      )
          : Column(
        children: [
          InkWell(
            onTap: isVisible,
            child: Icon(Icons.search),
          ),
          if (FirebaseAuth.instance.currentUser!.photoURL ==
              StudentHomeScreen.studentHome)
            ChatItem(title: "Student Group", type: "", onTap: () {
              Navigator.pushNamed(context, GroupChat_Screen.id);
            },),
          Expanded(
              child:

              StreamBuilder<QuerySnapshot<PrivateChatModel>>(
                  stream:privateChatFirebase.getAllPrivateChat(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<PrivateChatModel> privateChatList = snapshot.data
                          ?.docs
                          .map((e) => e.data()).toList() ?? [];
                      return ListView.builder(
                          itemCount: privateChatList.length,
                          itemBuilder: (context, index) {
                            if(privateChatList[index].from==FirebaseAuth.instance.currentUser!.uid||privateChatList[index].to==FirebaseAuth.instance.currentUser!.uid){
                              return ChatItem(title: privateChatList[index].name,
                                type: privateChatList[index].type,onTap: (){
                                  Navigator.pushNamed(context, ChatScreen.chatScreen,arguments: privateChatList[index].id);
                                },);
                            }
                            return Container();
                          });
                    } else {
                      return const Center(child: Text('loading..'));
                    }
                  })
          )
        ],
      ),
    );
  }
}
