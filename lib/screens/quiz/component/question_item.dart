import 'package:flutter/material.dart';
import 'package:university/data/models/quiz_model.dart';

import '../../../data/firebase/quiz_firebase.dart';

class QuestionItem extends StatelessWidget {
  QuestionItem(
      {super.key,
      required this.question,
      required this.answersCount,
      required this.count,
      this.onTap});

  String question;
  int answersCount;
  int count;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
          title: Text(question),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text("answers count $answersCount"), Text("$count")],
          ),
          trailing: InkWell(
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onTap: onTap,
          )),
    );
  }
}
