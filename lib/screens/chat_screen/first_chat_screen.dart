// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:university/componenets/chat_bubble_model.dart';
// import 'package:university/constants.dart';
// import 'package:university/data/firebase/message_firebase.dart';
// import 'package:university/data/firebase/private_chat_firebase.dart';
// import 'package:university/data/models/messages.dart';
// import 'package:university/data/models/private_chat_model.dart';
// import 'package:university/data/models/user.dart';
//
// class FirstChatScreen extends StatefulWidget {
//   FirstChatScreen({super.key});
//
//   static String firstChatScreen = "firstChatScreen";
//
//   @override
//   State<FirstChatScreen> createState() => _FirstChatScreenState();
// }
//
// class _FirstChatScreenState extends State<FirstChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     MessageFirebase messageFirebase = MessageFirebase();
//     final userModel = ModalRoute.of(context)!.settings.arguments as UserModel;
//     String chatId = "";
//     final controller = TextEditingController();
//     return Scaffold(
//       backgroundColor: kOtherColor,
//       body: StreamBuilder<QuerySnapshot<MessageModel>>(
//           stream: messageFirebase.getAllPrivateMessage(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<MessageModel> messagesList =
//                   snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
//               return
//                 Column(
//                   children: [
//                     Expanded(
//                     child: ListView.builder(
//                                         reverse: true,
//                                         controller: messageFirebase.listViewController,
//                                         itemCount: messagesList.length,
//                                         itemBuilder: (context, index) {
//                     if (FirebaseAuth.instance.currentUser!.uid ==
//                         messagesList[index].uid) {
//                       return Caht_Bubble(
//                         message: messagesList[index],
//                       );
//                     }
//                     return Caht_Bubble_re(
//                       message: messagesList[index],
//                     );
//                                         },
//                                       ),
//                                   ),
//                     TextFormField(
//                       controller: controller,
//                       decoration: InputDecoration(
//                           suffixIcon: chatId.isEmpty
//                               ? InkWell(
//                             child: Icon(Icons.send),
//                             onTap: () async {
//                               await PrivateChatFirebase()
//                                   .createPrivateChat(userModel, controller.text);
//                               // chatId = await PrivateChatFirebase()
//                               //     .getLastPrivateChatId()
//                               //     .id;
//                               controller.clear();
//                             },
//                           )
//                               : InkWell(
//                             child: Icon(Icons.send),
//                             onTap: () async {
//                               await messageFirebase
//                                   .addPrivateMessage(chatId, controller.text);
//                               controller.clear();
//                             },
//                           ),
//                           hintText: "Type ...",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           )),
//                     )
//
//                   ],
//                 );
//             } else {
//               return const Center(child: Text('loading..'));
//             }
//           }),
//     );
//   }
// }
