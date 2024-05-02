import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/chat_screen/component/chat_item.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';

class GlobalSearchBar extends StatefulWidget {
  void Function()? isVisible;

  GlobalSearchBar({super.key, required this.isVisible});

  @override
  State<GlobalSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<GlobalSearchBar> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    UserFirebase userFirebase = UserFirebase();

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          TextFormField(
            onChanged: (v) {
              value = v;
              setState(() {});
            },
            style: TextStyle(
              color: Colors.black,fontSize: 16
            ),
            decoration: InputDecoration(

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    ),
                suffixIcon: InkWell(
                  onTap: widget.isVisible,
                  child: Icon(Icons.close),
                )),
          ),
          StreamBuilder<QuerySnapshot<UserModel>>(
              stream: FirebaseAuth.instance.currentUser!.photoURL ==
                  StudentHomeScreen.studentHome
                  ? userFirebase.getAllUsers()
                  : userFirebase.getAllStudent(),            builder: (context, snapshot) {
                if(snapshot.hasData){
                  List<UserModel> usersList = snapshot.data?.docs
                      .map((e) => e.data()).toList() ?? [];
                  return Expanded(
                      child: ListView.builder(
                          itemCount: usersList.length,
                          itemBuilder: (context, index) {
                            if ("${usersList[index].firstName} ${usersList[index].lastName}"
                                .contains(value) ||
                                usersList[index].phone.contains(value) ||
                                usersList[index].email.contains(value)) {
                              return ChatItem(title:"${usersList[index].firstName} ${usersList[index].lastName}",type: usersList[index].type,);
                            }
                            if (value.isEmpty) {
                              return ListTile(
                                tileColor: Colors.red,
                                title: Text("${usersList[index].firstName} ${usersList[index].lastName}"),
                              );
                            }
                            return Container();
                          }));

                }else{
                  return const Center(child: Text('loading..'));


                }
            }
          )
        ],
      ),
    );
  }
}
