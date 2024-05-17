import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';

class UserFirebase {
  final userRef = FirebaseFirestore.instance
      .collection('Users')
      .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson());

  addUser(UserModel userModel) async {
    try {
      final doc = userRef.doc();
      userModel.idStu = doc.id;
      userModel.uid = FirebaseAuth.instance.currentUser!.uid;
      await doc.set(userModel);
    } on Exception catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot<UserModel>> getUser() {
    return userRef
        .where(JsonKeyManager.uid,
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  getProfile() {
    return userRef
        .where(JsonKeyManager.uid,
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  Stream<QuerySnapshot<UserModel>> getAllUsers() {
    return userRef
        .where(JsonKeyManager.uid,
            isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  Stream<QuerySnapshot<UserModel>> getAllStudent() {
    return userRef
        .where(JsonKeyManager.type, isEqualTo: StudentHomeScreen.studentHome)
        .where(JsonKeyManager.uid,
            isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  newConnection(UserModel from, UserModel to) {
    from.connections?.add(
      to,
    );
    to.connections?.add(from,);
    userRef.doc(to.idStu).update(
        {
     JsonKeyManager.connections: FieldValue.arrayUnion(to.connections!.map((e) => e.toJson()).toList())
    });
    userRef.doc(from.idStu).update({
      JsonKeyManager.connections: FieldValue.arrayUnion(from.connections!.map((e) => e.toJson()).toList())
    });
  }
}
