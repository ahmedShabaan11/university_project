import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:university/data/firebase/quiz_firebase.dart';
import 'package:university/data/models/quiz_model.dart';
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
          try{  return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: listOfQuizzes.length,
                  itemBuilder: (context, index) {
                    try {
                      return QuizWidget(
                        subject: listOfQuizzes[index].subject,
                        questionCount: listOfQuizzes[index].questionList.length,
                        doctor: listOfQuizzes[index].doctor,
                        onTap: () {
                          Navigator.pushNamed(context, Quiz.quiz,
                              arguments: listOfQuizzes[index]);
                        },
                      );
                    } catch (e) {
                      print('');
                    }
                  }),
            );}catch(e){print('');}
          }
          return SizedBox();
        },
      ),
    );
  }
}
