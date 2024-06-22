import 'package:flutter/material.dart';
import 'package:university/data/models/quiz_model.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget(
      {super.key,
      required this.questionModel,
      required this.answer,
      required this.onChanged});

  QuestionModel questionModel;
  TextEditingController answer = TextEditingController();
  void Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(questionModel.question),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: questionModel.chooses.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Radio(
                      value: questionModel.chooses[index].isAnswer,
                      groupValue: answer.text,
                      onChanged: onChanged),
                  Text(questionModel.chooses[index].text)
                ],
              );
            }),
      ],
    );
  }
}
