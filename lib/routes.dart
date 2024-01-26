import 'package:flutter/cupertino.dart';
import 'package:university/screens/home_screen/home_screen.dart';

import 'package:university/screens/loginscreen/login.dart';
import 'package:university/screens/my_profile/my_profile.dart';
import 'package:university/screens/splash_screens/splash_screens.dart';

Map<String, WidgetBuilder> routes = {
//all screens will be registred  here like mainfest in android
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.id: (context) =>  HomeScreen(),
  MyProfileScreens.routeName: (context) => const MyProfileScreens(),
};
