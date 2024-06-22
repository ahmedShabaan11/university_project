import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'package:university/constants.dart';
import 'package:university/routes.dart';
import 'package:university/screens/home_screen/admin_home_screen.dart';
import 'package:university/screens/home_screen/prof_home_screen.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';
import 'package:university/screens/quiz/new_quiz_screen.dart';
import 'package:university/screens/splash_screens/splash_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:university/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,deviceType){
      return SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,

          title: "My University",
        //we will use light theme for  our app
          theme: CustomTheme().baseTheme,

          //initial route is splash screen
          //meen first screen
          initialRoute:SplashScreen.routeName,
          //define the routes file here in order to access the routes any where all over the app
          routes: routes,
        ),
      );
    });
  }
}
