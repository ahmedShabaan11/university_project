import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/models/meet_model.dart';

class MeetFirebase {
  final meetRef = FirebaseFirestore.instance
      .collection('Meet')
      .withConverter<MeetModel>(
          fromFirestore: (snapshot, _) => MeetModel.fromJson(snapshot.data()!),
          toFirestore: (meet, _) => meet.toJson());
  DateTime? start;
  TimeOfDay? startTime;
  DateTime? end;
  TimeOfDay? endTime;
  TextEditingController url = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  Future<void> newMeet() async {
    try {
      final doc = meetRef.doc();
      await doc.set(MeetModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        doctor: FirebaseAuth.instance.currentUser!.displayName!,
        start: DateTime(start!.year,start!.month,start!.day,startTime!.hour,startTime!.minute),
        end: DateTime(end!.year,end!.month,end!.day,endTime!.hour,endTime!.minute),
        url: url.text,
        id: doc.id,
      ));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Stream<QuerySnapshot<MeetModel>> getMeet() {
    return meetRef
        .where(
          JsonKeyManager.start,
          isLessThan: DateTime.now().add(Duration(hours: 3)),
        ).snapshots();
  }

  Stream<QuerySnapshot<MeetModel>> getMyAllMeet() {
    return meetRef
        .where(
          JsonKeyManager.uid,
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .where(JsonKeyManager.end, isGreaterThan: DateTime.now())
        .snapshots();
  }

  Stream<QuerySnapshot<MeetModel>> getAllMeet() {
    return meetRef
        .where(JsonKeyManager.end, isGreaterThan: DateTime.now())
        .snapshots();
  }

  Future<void> deleteMeet(String id) async {
    await meetRef.doc(id).delete();
  }
}
