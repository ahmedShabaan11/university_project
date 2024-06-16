import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/button_home.dart';
import 'package:university/componenets/button_home_model.dart';
import 'package:university/constants.dart';
import 'package:university/data/firebase/meet_firebase.dart';
import 'package:university/data/models/meet_model.dart';
import 'package:university/screens/chat_screen/component/global_search_bar.dart';
import 'package:university/screens/meet/component/meet_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfHomeScreen extends StatefulWidget {
  const ProfHomeScreen({super.key});

  static String profHome = "doctor";

  @override
  State<ProfHomeScreen> createState() => _ProfHomeScreenState();
}

class _ProfHomeScreenState extends State<ProfHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOtherColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("D.${FirebaseAuth.instance.currentUser!.displayName}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<MeetModel>>(
                stream: MeetFirebase().getMeet(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MeetModel> listOfMeet =
                        snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                    return listOfMeet.isNotEmpty
                        ? MeetWidget(meetModel: listOfMeet.first)
                        : SizedBox();
                  }
                  return SizedBox();
                }),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: listProHomeButton.length,
                itemBuilder: (context, index) =>
                    ButtonHome(buttonHomeModel: listProHomeButton[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
