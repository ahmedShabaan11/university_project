import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university/constants.dart';
import 'package:university/screens/loginscreen/login.dart';

class SplashScreen extends StatelessWidget {
  //route name for our screen
  static String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.routeName, (route) => false);
    });
    //scaffold color set to primary  color in main in our text theme
    return Scaffold(
      //its a row  with a column
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kTextWhiteColor,
                      fontSize: 50.0,
                      letterSpacing: 2.0,
                      fontStyle: FontStyle.italic),
                ),
                Text("University",
                    style: GoogleFonts.pattaya(
                        fontSize: 50.0,
                        fontStyle: FontStyle.italic,
                        color: kTextWhiteColor,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            Image.asset(
              "assets/images/splash.png",
              height: 150.0,
              width: 150.0,
            ),
          ],
        ),
      ),
    );
  }
}
