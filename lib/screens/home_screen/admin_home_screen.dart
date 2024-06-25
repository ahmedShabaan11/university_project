
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/button_home.dart';
import 'package:university/componenets/button_home_model.dart';
import 'package:university/constants.dart';
import 'package:university/screens/signup_screen/sign_up_prof.dart';
import 'package:university/screens/splash_screens/splash_screens.dart';


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
      drawer: Drawer(
        child: Column(
          children: [
            Card(elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
              child: InkWell(
                onTap: () async {
                  Navigator.pushNamedAndRemoveUntil(
                      context, SplashScreen.routeName, (route) => false);
                  await FirebaseAuth.instance.signOut();
                },
                child: const Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(
                        Icons.power_settings_new_rounded,
                        color: Colors.red,
                      ),
                      kHalfWidthSizedBox,
                      Text(
                        'Sign Out',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
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
