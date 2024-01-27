
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:university/screens/chat_screen/chat_screen.dart';

class ButtonHomeModel {
  String title;
  IconData icon;
  void Function(BuildContext context) onTap;

  ButtonHomeModel(
      {required this.title, required this.icon, required this.onTap});
}

List<ButtonHomeModel> listButtonHome = [
  ButtonHomeModel(
    title: 'Take Quiz',
    icon: Icons.quiz,
    onTap: (context) {},
  ),
  ButtonHomeModel(
      title: 'Discussion From',
      icon: Icons.holiday_village,
      onTap: (context) {}),
  ButtonHomeModel(
    title: 'Result',
    icon: Icons.ac_unit,
    onTap: (context) {},
  ),
  ButtonHomeModel(
    title: 'Assigments',
    icon: Icons.assignment_add,
    onTap: (context) {},
  ),
  ButtonHomeModel(
      title: 'Chat',
      icon: Icons.format_align_justify_rounded,
      onTap: (context) { Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Chat_Screen()),
      );
      },),
  ButtonHomeModel(
    title: 'Courses',
    icon: Icons.data_array,
    onTap: (context) {}
  ),
];
