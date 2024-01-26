import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university/constants.dart';
import 'package:university/routes.dart';
import 'package:university/screens/splash_screens/splash_screens.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My University",
//we will use light theme for  our app
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.lightGreen,

        primaryColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          color: Colors.lightGreen,
          elevation: 0,
        ),
        textTheme:
            GoogleFonts.sourceCodeProTextTheme(Theme.of(context).textTheme)
                .apply()
                .copyWith(
                  bodyText1: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                  bodyText2: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w100),
                  subtitle1: const TextStyle(
                    color: kTextWhiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle2: const TextStyle(
                    color: kTextWhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
        //input Decorartion theme for all our the app
        inputDecorationTheme: const InputDecorationTheme(
          //label style for formField
          labelStyle: TextStyle(
            height: .5,
            fontSize: 15,
            color: kTextLightColor,
          ),
          //hint Style
          hintStyle: TextStyle(
            height: .5,
            fontSize: 16,
            color: kTextBlackColor,
          ),
          //we are using under line input border
          //not out line
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextLightColor,
              width: 0.7,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: kTextLightColor),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kTextLightColor),
          ),
          //on focus change color
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
          //color change when user enters wrong information
          //we will use validators  for this process
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
            //same on focus erorr color
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
          ),
        ),
      ),

      //initial route is splash screen
      //meen first screen
      initialRoute: SplashScreen.routeName,
      //define the routes file here in order to access the routes any where all over the app
      routes: routes,
    );
  }
}
