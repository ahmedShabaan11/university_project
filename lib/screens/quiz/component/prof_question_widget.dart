import 'package:flutter/material.dart';
import 'package:university/data/models/quiz_model.dart';

class ProfQuestionWidget extends StatefulWidget {
  ProfQuestionWidget({
    super.key,
    required this.questionModel,
  });

  QuestionModel questionModel;

  @override
  State<ProfQuestionWidget> createState() => _ProfQuestionWidgetState();
}

class _ProfQuestionWidgetState extends State<ProfQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Text(widget.questionModel.question),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.questionModel.chooses.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Radio(
                    value: widget.questionModel.chooses[index].isAnswer,
                    groupValue: true,
                    onChanged: (v) {},
                  ),
                  Text(widget.questionModel.chooses[index].text)
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
