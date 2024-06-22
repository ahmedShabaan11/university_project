import 'package:flutter/material.dart';
import 'package:university/componenets/button_home.dart';
import 'package:university/constants.dart';

import 'package:university/screens/my_profile/my_profile.dart';

import '../../componenets/home_components.dart';

class StudentHomeScreen extends StatelessWidget {
  StudentHomeScreen({super.key});

  static String studentHome = 'student';
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: StudentHomeComponents()
    );
  }
}
