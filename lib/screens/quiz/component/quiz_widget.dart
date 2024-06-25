import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  QuizWidget(
      {super.key,
      required this.subject,
      required this.questionCount,
      required this.doctor,
      this.onTap});

  String subject;
  String doctor;
  int questionCount;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(subject),
        subtitle: Text("questions count $questionCount"),
        trailing: Text(doctor),
        onTap: onTap,
      ),
    );
  }
}
