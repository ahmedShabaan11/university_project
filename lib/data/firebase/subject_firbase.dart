import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:university/data/models/subject_model.dart';

class SubjectFirebase {
  final subjectRef = FirebaseFirestore.instance
      .collection("subject")
      .withConverter(
          fromFirestore: (snapshot, _) =>
              SubjectModel.fromJson(snapshot.data()!),
          toFirestore: (subject, _) => subject.toJson());
  TextEditingController hour = TextEditingController();
  TextEditingController name = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> newSubject() async {
    try {
      final doc = subjectRef.doc();
      await doc.set(SubjectModel(
          hour: int.parse(hour.text), name: name.text, id: doc.id));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  getAllSubject() {
    return subjectRef.snapshots();
  }

  Future<void> deleteSubject(String id) async {
    try {
      return await subjectRef.doc(id).delete();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
