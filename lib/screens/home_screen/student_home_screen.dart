import 'package:flutter/material.dart';
import 'package:university/screens/home_screen/component/button_home.dart';
import 'package:university/constants.dart';

import 'package:university/screens/my_profile/my_profile.dart';

import 'component/home_components.dart';

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
