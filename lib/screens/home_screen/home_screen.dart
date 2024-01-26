import 'package:flutter/material.dart';
import 'package:university/componenets/button_home.dart';
import 'package:university/constants.dart';
import 'package:university/models/chat_model.dart';

import 'package:university/screens/my_profile/my_profile.dart';

import '../../componenets/home_components.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: homeComponents()

    );
  }
}
