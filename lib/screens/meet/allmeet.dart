
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:university/data/firebase/meet_firebase.dart';
import 'package:university/data/models/meet_model.dart';
import 'package:university/screens/meet/component/meet_widget.dart';

class AllMeets extends StatelessWidget {
  static String allMeets="AllMeets";
  @override
  Widget build(BuildContext context) {
    MeetFirebase meetFirebase = MeetFirebase();
    return Scaffold(
      appBar: AppBar(title: Text("All Meets"),),

      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot<MeetModel>>(
        stream: meetFirebase.getAllMeet(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MeetModel> listOfMeet =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return ListView.builder(
                itemCount: listOfMeet.length,
                itemBuilder: (context, index) {
                  return MeetWidget(meetModel: listOfMeet[index]);
                });
          }
          return SizedBox();
        },
      ),
    );
  }
}
