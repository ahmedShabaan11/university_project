import 'package:flutter/material.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/quiz_model.dart';
import 'package:university/data/models/user.dart';
import 'package:university/screens/quiz/component/question_widget.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  static String quiz="quiz";
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  UserModel? userModel;
  List<int> selectedValue=[];
  @override
  Widget build(BuildContext context) {
    UserFirebase().getProfile().then(
      (value) {
        userModel = value.docs.first.data();
      },
    );
    final formKey = GlobalKey<FormState>();
    int questionIndex = 0;
    QuizModel quizModel =
        ModalRoute.of(context)!.settings.arguments as QuizModel;
    List<TextEditingController> listOfAnswers = [];
    for (var element in quizModel.questionList) {
      listOfAnswers.add(TextEditingController());
      selectedValue.add(-1);
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
              Expanded(
                child: ListView(
                  children: [
                    Text(quizModel.questionList[questionIndex].question),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: quizModel.questionList[questionIndex].chooses.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Radio(
                                  value: index,
                                  groupValue: selectedValue[questionIndex],
                                  onChanged: (v){
                                    selectedValue[questionIndex]=v!;
                                    setState(() {

                                    });
                                  }),
                                Text(quizModel.questionList[questionIndex].chooses[index].text)
                            ],
                          );
                        }),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  questionIndex!=0?InkWell(
                    onTap: () {
                      if (questionIndex > 0) {
                        questionIndex--;
                        setState(() {});
                      }
                    },
                    child: Column(
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text("Back"),
                      ],
                    ),
                  ):SizedBox(),
                  listOfAnswers.length - 1 == questionIndex
                      ? InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              QuizModel solveQuiz = QuizModel(
                                  id: quizModel.id,
                                  uid: quizModel.uid,
                                  doctor: quizModel.doctor,
                                  subject: quizModel.subject,
                                  questionList: []);
                              for (int i=0 ; i<listOfAnswers.length;i++) {
                                solveQuiz.questionList.add(
                                  QuestionModel(
                                      question:
                                      quizModel.questionList[i].question,
                                      chooses: [
                                        Answer(
                                          text: quizModel.questionList[questionIndex].chooses[selectedValue[questionIndex]].text,
                                          isAnswer:quizModel.questionList[questionIndex].chooses[selectedValue[questionIndex]].isAnswer,
                                        ),
                                      ]),
                                );
                              }

                              userModel!.listOfQuizzes!.add(solveQuiz);
                              UserFirebase().solveNewQuiz(userModel!);
                            }
                            setState(() {});
                            Navigator.pop(context);
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
                            if (questionIndex < listOfAnswers.length - 1) {
                              questionIndex++;
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
