import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/data/firebase/quiz_firebase.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/quiz_model.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/quiz/component/question_item.dart';
import 'package:university/screens/quiz/component/quiz_widget.dart';
import 'package:university/screens/quiz/quiz.dart';

class AllQuizzes extends StatelessWidget {
  const AllQuizzes({super.key});

  static String allQuizzes = "allQuizzes";

  @override
  Widget build(BuildContext context) {
    QuizFirebase quizFirebase = QuizFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text("All Quizzes"),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot<QuizModel>>(
        stream: quizFirebase.getAllQuizzes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QuizModel> listOfQuizzes =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: listOfQuizzes.length,
                  itemBuilder: (context, index) {
                    return StreamBuilder<QuerySnapshot<UserModel>>(
                        stream: UserFirebase().getUser(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            UserModel userModel =
                                snapshot.data!.docs.first.data();
                            if (userModel.listOfQuizzes!
                                .map((e) => e.id)
                                .toList()
                                .contains(listOfQuizzes[index].id)) {
                              return SizedBox();
                            }
                            return QuizWidget(
                              subject: listOfQuizzes[index].subject,
                              questionCount:
                                  listOfQuizzes[index].questionList.length,
                              doctor: listOfQuizzes[index].doctor,
                              onTap: () {
                                Navigator.pushNamed(context, Quiz.quiz,
                                    arguments: listOfQuizzes[index]);
                              },
                            );
                          }

                          return const SizedBox();
                        });
                  }),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
