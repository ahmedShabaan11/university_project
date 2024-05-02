import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';

class UserFirebase {
  final userRef = FirebaseFirestore.instance
      .collection('Users')
      .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJsonU(snapshot.data()!),
          toFirestore: (user, _) => user.toJsonU());

  addUser(UserModel userModel) {
    final doc = userRef.doc();
    userModel.idStu = doc.id;
    userModel.uid = FirebaseAuth.instance.currentUser!.uid;
    doc.set(userModel);
  }

  getUser() {
    return userRef
        .where(JsonKeyManager.uid,
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  Stream<QuerySnapshot<UserModel>> getAllUsers(){
    return userRef.snapshots();
  }
  Stream<QuerySnapshot<UserModel>> getAllStudent(){
    return userRef.where(JsonKeyManager.type,isEqualTo: StudentHomeScreen.studentHome).snapshots();
  }

}
