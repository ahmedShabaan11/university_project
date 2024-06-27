import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:university/data/firebase/quiz_firebase.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/quiz_model.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/quiz/component/prof_question_widget.dart';
import 'package:university/screens/quiz/component/question_widget.dart';
import 'package:university/screens/quiz/quiz.dart';

class ProfQuiz extends StatefulWidget {
  ProfQuiz({super.key});

  int questionIndex = 0;
  static String profQuiz = "profQuiz";

  @override
  State<ProfQuiz> createState() => _ProfQuizState();
}

class _ProfQuizState extends State<ProfQuiz> {
  @override
  Widget build(BuildContext context) {
    QuizModel quizModel =
        ModalRoute.of(context)!.settings.arguments as QuizModel;
    List<ProfQuestionWidget> listOfQuestionWidget = [];
    for (var element in quizModel.questionList) {
      listOfQuestionWidget.add(ProfQuestionWidget(questionModel: element));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onTap: () {
              QuizFirebase().deleteQuizzes(quizModel.id);
           Navigator.pop(context); },
          )
        ],
        title: const Text("quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            listOfQuestionWidget[widget.questionIndex],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widget.questionIndex != 0
                    ? InkWell(
                        onTap: () {
                          if (widget.questionIndex > 0) {
                            widget.questionIndex--;
                            setState(() {});
                          }
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.arrow_back_ios),
                            Text("Back"),
                          ],
                        ),
                      )
                    : const SizedBox(),
                listOfQuestionWidget.length - 1 == widget.questionIndex
                    ? SizedBox()
                    : InkWell(
                        onTap: () {
                          if (widget.questionIndex <
                              listOfQuestionWidget.length - 1) {
                            widget.questionIndex++;
                          }
                          setState(() {});
                        },
                        child: const Column(
                          children: [
                            Icon(Icons.arrow_forward_ios),
                            Text("Next"),
                          ],
                        ),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
