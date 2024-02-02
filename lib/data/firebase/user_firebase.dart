import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/data/models/user.dart';

class UserFirebase {
  final UserRef = FirebaseFirestore.instance
      .collection('Users')
      .withConverter<user>(
      fromFirestore: (snapshot, _) => user.fromJsonU(snapshot.data()!),
      toFirestore: (user, _) => user.toJsonU());

  //addUser() {
   // final doc = UserRef.doc();
  //  user User = ///user(//phone: FirebaseAuth.instance.currentUser,
    //    firstName: FirebaseFirestore.instance.toString(),
      //  lastName: FirebaseFirestore.instance.toString(),
       // idStu: FirebaseFirestore.instance.toString(),
       // password: FirebaseFirestore.instance.toString());

}
