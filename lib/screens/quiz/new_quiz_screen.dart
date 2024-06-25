import 'package:flutter/material.dart';
import 'package:university/componenets/custom_text_formfeild.dart';
import 'package:university/data/firebase/quiz_firebase.dart';
import 'package:university/screens/quiz/component/new_question_widget.dart';
import 'package:university/screens/quiz/component/question_item.dart';

import '../../data/models/quiz_model.dart';

class NewQuizScreen extends StatefulWidget {
  static String newQuizScreen = "newQuizScreen";

  @override
  State<NewQuizScreen> createState() => _NewQuizScreenState();
}

@override
class _NewQuizScreenState extends State<NewQuizScreen> {
  @override
  bool needMore = false;
  QuizFirebase quizFirebase = QuizFirebase();
  List<QuestionModel> listOfQuestion = [];

  Widget build(BuildContext context) {
    return needMore
        ? NewQuestionWidget(
            onPressed: () {
              setState(() {
                needMore = !needMore;
              });
            },
            listOfQuestion: listOfQuestion,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("New Quiz"),
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    text: "Enter Subject",
                    controller: quizFirebase.subject,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: listOfQuestion.length,
                        itemBuilder: (context, index) {
                          return QuestionItem(
                            question: listOfQuestion[index].question,
                            answersCount: listOfQuestion[index].chooses.length,
                            count: index + 1,
                            onTap: () {
                              listOfQuestion.removeAt(index);
                        setState(() {

                        });
                            },
                          );
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          needMore = !needMore;
                        });
                      },
                      child: Icon(Icons.add))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.done),
              onPressed: () {
                if (listOfQuestion.isEmpty) {
                  return;
                }
                setState(() {
                  quizFirebase
                      .newQuiz(listOfQuestion)
                      .then((value) => listOfQuestion.clear());
                  quizFirebase.subject.clear();
                });
                Navigator.pop(context);
              },
            ),
          );
  }
}
