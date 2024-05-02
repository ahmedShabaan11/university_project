
import 'package:flutter/material.dart';
import 'package:university/componenets/button_home.dart';
import 'package:university/componenets/button_home_model.dart';
import 'package:university/constants.dart';
import 'package:university/screens/signup_screen/sign_up_prof.dart';


class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});
  static String admin="admin";
  @override
  State<AdminHomeScreen> createState() => _ProfHomeScreenState();
}

class _ProfHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: listAdminHomeButton.length,
          itemBuilder: (context, index) =>
              ButtonHome(buttonHomeModel: listAdminHomeButton[index]),
        ),
      ),
    );
  }
}
