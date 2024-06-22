import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
   QuestionItem({super.key,required this.question,required this.answersCount,required this.count});
String question;
int answersCount;
int count;
  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,
      child: ListTile(title: Text(question),subtitle: Text("answers count $answersCount"),trailing: Text("$count"),),
    );
  }
}
