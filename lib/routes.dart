import 'package:flutter/cupertino.dart';
import 'package:university/screens/chat_screen/chat_list.dart';
import 'package:university/screens/chat_screen/chat_screen.dart';
import 'package:university/screens/chat_screen/first_chat_screen.dart';
import 'package:university/screens/chat_screen/group_chat_screen.dart';
import 'package:university/screens/home_screen/admin_home_screen.dart';
import 'package:university/screens/home_screen/prof_home_screen.dart';
import 'package:university/screens/home_screen/student_home_screen.dart';

import 'package:university/screens/loginscreen/login.dart';
import 'package:university/screens/meet/add_meet.dart';
import 'package:university/screens/meet/allmeet.dart';
import 'package:university/screens/meet/component/meet_widget.dart';
import 'package:university/screens/meet/my_meet.dart';
import 'package:university/screens/my_profile/my_profile.dart';
import 'package:university/screens/signup_screen/sign_up_prof.dart';
import 'package:university/screens/splash_screens/splash_screens.dart';

Map<String, WidgetBuilder> routes = {
//all screens will be registred  here like mainfest in android
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  GroupChat_Screen.id: (_) => GroupChat_Screen(),
  StudentHomeScreen.studentHome: (context) => StudentHomeScreen(),
  MyProfileScreens.routeName: (context) => MyProfileScreens(),
  SignUpProf.newProfAcc: (context) => SignUpProf(),
  AdminHomeScreen.admin: (context) => AdminHomeScreen(),
  ProfHomeScreen.profHome: (context) => ProfHomeScreen(),
  MyProfileScreens.routeName: (context) => MyProfileScreens(),
  ChatList.chatList: (context) => ChatList(),
  ChatScreen.chatScreen: (context) => ChatScreen(),
  AddMeet.addMeet: (context) => AddMeet(),
  MyMeets.myMeets: (context) => MyMeets(),
  AllMeets.allMeets: (context) => AllMeets(),
// FirstChatScreen.firstChatScreen: (context) =>  FirstChatScreen(),
};
