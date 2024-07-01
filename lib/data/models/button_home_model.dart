import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:university/screens/chat_screen/chat_list.dart';
import 'package:university/screens/chat_screen/group_chat_screen.dart';
import 'package:university/screens/meet/add_meet.dart';
import 'package:university/screens/meet/allmeet.dart';
import 'package:university/screens/meet/my_meet.dart';
import 'package:university/screens/quiz/all_quizzes.dart';
import 'package:university/screens/quiz/my_quizzes.dart';
import 'package:university/screens/quiz/new_quiz_screen.dart';
import 'package:university/screens/signup_screen/sign_up_prof.dart';
import 'package:university/screens/subject/add_subject.dart';
import 'package:university/screens/subject/subjectScreen.dart';
import 'package:university/screens/subject/view_subject_screen.dart';

class ButtonHomeModel {
  String title;
  IconData icon;
  void Function(BuildContext context) onTap;

  ButtonHomeModel(
      {required this.title, required this.icon, required this.onTap});
}

List<ButtonHomeModel> listStudentHomeButton = [

  ButtonHomeModel(
    title: 'Quizzes',
    icon: Icons.assignment_add,
    onTap: (context) {
      Navigator.pushNamed(context, AllQuizzes.allQuizzes);
    },
  ),
  ButtonHomeModel(
    title: 'Chat',
    icon: Icons.format_align_justify_rounded,
    onTap: (context) {
      Navigator.pushNamed(context, ChatList.chatList);
    },
  ),
  ButtonHomeModel(
      title: 'All meets',
      icon: Icons.meeting_room,
      onTap: (context) {
        Navigator.pushNamed(context, AllMeets.allMeets);
      }),
  ButtonHomeModel(
    title: 'Subjects',
    icon: Icons.insert_chart_outlined_rounded,
    onTap: (context) {
      Navigator.pushNamed(context, Subject.subjectScreen);
    },
  )
];

List<ButtonHomeModel> listProHomeButton = [
  ButtonHomeModel(
      title: 'New Quiz',
      icon: Icons.quiz,
      onTap: (context) {
        Navigator.pushNamed(context, NewQuizScreen.newQuizScreen);
      }),
  ButtonHomeModel(
      title: 'Chat',
      icon: Icons.chat,
      onTap: (context) {
        Navigator.pushNamed(context, ChatList.chatList);
      }),
  ButtonHomeModel(
      title: 'New meeting',
      icon: Icons.meeting_room_outlined,
      onTap: (context) {
        Navigator.pushNamed(context, AddMeet.addMeet);
      }),
  ButtonHomeModel(
      title: 'My meets',
      icon: Icons.meeting_room_rounded,
      onTap: (context) {
        Navigator.pushNamed(context, MyMeets.myMeets);
      }),
  ButtonHomeModel(
      title: 'All meets',
      icon: Icons.meeting_room,
      onTap: (context) {
        Navigator.pushNamed(context, AllMeets.allMeets);
      }),
  ButtonHomeModel(
      title: 'My Quiz',
      icon: Icons.assessment,
      onTap: (context) {
        Navigator.pushNamed(context, MyQuizzes.myQuizzes);
      }),
];

List<ButtonHomeModel> listAdminHomeButton = [
  ButtonHomeModel(
      title: 'Add New Prof',
      icon: Icons.person,
      onTap: (context) {
        Navigator.pushNamed(context, SignUpProf.newProfAcc);
      }),ButtonHomeModel(
      title: 'Add New Subject',
      icon: Icons.subject,
      onTap: (context) {
        Navigator.pushNamed(context, AddSubject.addSubject);
      }),ButtonHomeModel(
      title: 'View Subject',
      icon: Icons.book,
      onTap: (context) {
        Navigator.pushNamed(context, ViewSubject.viewSubject);
      }),
];
