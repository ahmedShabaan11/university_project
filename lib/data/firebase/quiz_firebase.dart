import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:university/core/key_manager.dart';
import 'package:university/data/models/quiz_model.dart';

class QuizFirebase {
  final quizRef = FirebaseFirestore.instance
      .collection('Quiz')
      .withConverter<QuizModel>(
          fromFirestore: (snapshot, _) => QuizModel.fromJson(snapshot.data()!),
          toFirestore: (quiz, _) => quiz.toJson());

  TextEditingController subject = TextEditingController();

  Future<void> newQuiz(List<QuestionModel>listOfQuestion) async {
    try {
      final doc = quizRef.doc();
      await doc.set(QuizModel(
          id: doc.id,
          uid: FirebaseAuth.instance.currentUser!.uid,
          doctor: FirebaseAuth.instance.currentUser!.displayName!,
          subject: subject.text,
          questionList: listOfQuestion));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Stream<QuerySnapshot<QuizModel>> getMyAllQuizzes() {
    return quizRef
        .where(
          JsonKeyManager.uid,
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<QuizModel>> getAllQuizzes() {
    return quizRef.snapshots();
  }

  Future<void> deleteQuizzes(String id) async {
    await quizRef.doc(id).delete();
  }
}
