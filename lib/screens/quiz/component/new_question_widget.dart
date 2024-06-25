import 'package:flutter/material.dart';
import 'package:university/componenets/custom_text_formfeild.dart';
import 'package:university/data/firebase/quiz_firebase.dart';
import 'package:university/data/models/quiz_model.dart';
import 'package:university/screens/quiz/component/new_answer_widget.dart';

class NewQuestionWidget extends StatefulWidget {
  NewQuestionWidget({  this.listOfQuestion ,this.onPressed});
  void Function()? onPressed;
  static String newQuestionScreen = "newQuestionScreen";
  List<TextEditingController> listOfAnswerController = [];
  List<Answer> listOfAnswer = [];
  TextEditingController question=TextEditingController();
  String? selectedValue;
  List<QuestionModel>?listOfQuestion=[];
  // QuestionModel? questionModel;
  @override
  State<NewQuestionWidget> createState() => _NewQuestionWidgetState();
}

class _NewQuestionWidgetState extends State<NewQuestionWidget> {

  @override
  Widget build(BuildContext context) {
    final formKey=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Question"),),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  text: "Enter Question",
                  maxLines: null,
                  controller: widget.question,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.listOfAnswerController.length,
                    itemBuilder: (context, index) {
                      return NewAnswerWidget(
                        groupValue: widget.selectedValue,
                        onChanged: (v) {
                          widget.selectedValue = v;
                          setState(() {});
                        },
                        value: widget.listOfAnswerController[index].text,
                        controller: widget.listOfAnswerController[index],
                        onPressed: () {
                          widget.listOfAnswerController.removeAt(index);
                          setState(() {});
                        },
                      );
                    }),
                TextButton(
                  onPressed: () {
                    widget.listOfAnswerController.add(TextEditingController());
                    setState(() {});
                  },
                  child: Text("Add Answer"),
                ),
                TextButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        for (var element in widget.listOfAnswerController) {
                          widget.listOfAnswer.add(Answer(
                              text: element.text,
                              isAnswer: element.text == widget.selectedValue));
                        }
                      widget.listOfQuestion!.add(QuestionModel(question: widget.question.text, chooses: widget.listOfAnswer));
                        widget.onPressed!();
                      }
                    },
                    child: Text("Done")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
