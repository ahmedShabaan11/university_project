import 'package:flutter/material.dart';
import 'package:university/data/models/quiz_model.dart';

class QuestionWidget extends StatefulWidget {
  QuestionWidget(
      {super.key,
      required this.questionModel,
      this.selectedValue = -1,
      this.onChanged});

  int selectedValue;
  QuestionModel questionModel;

  TextEditingController answer = TextEditingController();
  void Function(Object?)? onChanged;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

 class _QuestionWidgetState extends State<QuestionWidget> {
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
                      value: index,
                      groupValue: widget.selectedValue,
                      onChanged: (v) {
                        widget.selectedValue = v!;
                        setState(() {});
                      }),
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
