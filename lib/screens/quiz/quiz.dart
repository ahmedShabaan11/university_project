import 'package:flutter/material.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/quiz_model.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/quiz/component/question_widget.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  int questionIndex = 0;
  static String quiz = "quiz";

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  UserModel? userModel;
  List<int> selectedValue = [];

  @override
  Widget build(BuildContext context) {
    UserFirebase().getProfile().then(
      (value) {
        userModel = value.docs.first.data();
      },
    );
    List<QuestionWidget> listQuestionWidget = [];
    final formKey = GlobalKey<FormState>();

    QuizModel quizModel =
        ModalRoute.of(context)!.settings.arguments as QuizModel;
    List<TextEditingController> listOfAnswers = [];
    for (int i = 0; i < quizModel.questionList.length; i++) {
      listOfAnswers.add(TextEditingController());
      selectedValue.add(-1);
      listQuestionWidget.add(
        QuestionWidget(
          questionModel: quizModel.questionList[i],
          selectedValue: selectedValue[i],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("quiz"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              listQuestionWidget[widget.questionIndex],
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
                          child: Column(
                            children: [
                              Icon(Icons.arrow_back_ios),
                              Text("Back"),
                            ],
                          ),
                        )
                      : SizedBox(),
                  listOfAnswers.length - 1 == widget.questionIndex
                      ? InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              QuizModel solveQuiz = QuizModel(
                                  id: quizModel.id,
                                  uid: quizModel.uid,
                                  doctor: quizModel.doctor,
                                  subject: quizModel.subject,
                                  questionList: []);
                              for (int i = 0; i < listOfAnswers.length; i++) {
                                solveQuiz.questionList.add(
                                  QuestionModel(
                                      question:
                                          quizModel.questionList[i].question,
                                      chooses: [
                                        Answer(
                                          text: listQuestionWidget[
                                                  widget.questionIndex]
                                              .questionModel
                                              .chooses[listQuestionWidget[
                                                      widget.questionIndex]
                                                  .selectedValue]
                                              .text,
                                          isAnswer: listQuestionWidget[
                                                  widget.questionIndex]
                                              .questionModel
                                              .chooses[listQuestionWidget[
                                                      widget.questionIndex]
                                                  .selectedValue]
                                              .isAnswer,
                                        ),
                                      ]),
                                );
                              }

                              userModel!.listOfQuizzes!.add(solveQuiz);
                              UserFirebase().solveNewQuiz(userModel!);
                            }
                            setState(() {});
                            try {
                              Navigator.pop(context);
                            } catch (e) {
                              print(' ');
                            }
                          },
                          child: Column(
                            children: [
                              Icon(Icons.done),
                              Text("Done"),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            if (widget.questionIndex <
                                listOfAnswers.length - 1) {
                              widget.questionIndex++;
                            }
                            setState(() {});
                          },
                          child: Column(
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
      ),
    );
  }
}
