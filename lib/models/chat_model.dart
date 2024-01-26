
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:university/screens/chat_screen/chat_screen.dart';

class buttonHomeModel {
  String title;
  IconData icon;
  void Function(BuildContext context) onTap;

  buttonHomeModel(
      {required this.title, required this.icon, required this.onTap});
}

List<buttonHomeModel> listButtonHome = [
  buttonHomeModel(
    title: 'Take Quiz',
    icon: Icons.quiz,
    onTap: (context) {},
  ),
  buttonHomeModel(
      title: 'Discussion From',
      icon: Icons.holiday_village,
      onTap: (context) {}),
  buttonHomeModel(
    title: 'Result',
    icon: Icons.ac_unit,
    onTap: (context) {},
  ),
  buttonHomeModel(
    title: 'Assigments',
    icon: Icons.assignment_add,
    onTap: (context) {},
  ),
  buttonHomeModel(
      title: 'Chat',
      icon: Icons.format_align_justify_rounded,
      onTap: (context) { Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Chat_Screen()),
      );
      },),
  buttonHomeModel(
    title: 'Courses',
    icon: Icons.data_array,
    onTap: (context) {}
  ),
];
