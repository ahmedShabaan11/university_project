import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/chat_screen/chat_screen.dart';
import 'package:university/screens/chat_screen/component/chat_item.dart';
import 'package:university/screens/chat_screen/first_chat_screen.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';

class GlobalSearchBar extends StatefulWidget {
  void Function()? isVisible;

  GlobalSearchBar({super.key, required this.isVisible});

  @override
  State<GlobalSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<GlobalSearchBar> {
  String value = "";
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    UserFirebase userFirebase = UserFirebase();
    userFirebase.getProfile().then(
      (value) {
        userModel = value.docs.first.data();
      },
    );
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          TextFormField(
            onChanged: (v) {
              value = v;
              setState(() {});
            },
            style: TextStyle(color: Colors.black, fontSize: 16),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                suffixIcon: InkWell(
                  onTap: widget.isVisible,
                  child: Icon(Icons.close),
                )),
          ),
          StreamBuilder(
              stream: FirebaseAuth.instance.currentUser!.photoURL ==
                      StudentHomeScreen.studentHome
                  ? userFirebase.getAllUsers()
                  : userFirebase.getAllStudent(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<UserModel> usersList =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  return Expanded(
                      child: ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      // userFirebase.newConnection(usersList[0], usersList[1]);
                      if ("${usersList[index].firstName} ${usersList[index].lastName}".toLowerCase()
                              .contains(value.toLowerCase()) ||
                          usersList[index].email.toLowerCase().contains(value.toLowerCase()) ||
                          usersList[index].phone.contains(value)) {
                        return ChatItem(
                          title:
                              "${usersList[index].firstName} ${usersList[index].lastName}",
                          type: usersList[index].type,
                          onTap: () {
                            Navigator.pushNamed(context, ChatScreen.chatScreen,
                                arguments: [userModel, usersList[index]]);
                          },
                        );
                      }
                      if (value.isEmpty) {
                        return ChatItem(
                          title:
                              "${usersList[index].firstName} ${usersList[index].lastName}",
                          type: usersList[index].type,
                          onTap: () {
                            Navigator.pushNamed(context, ChatScreen.chatScreen,
                                arguments: [userModel, usersList[index]]);
                          },
                        );
                      }
                      return SizedBox();
                    },
                  ));
                }
                return Center(
                  child: Text("Loading..."),
                );
              })
        ],
      ),
    );
  }
}
