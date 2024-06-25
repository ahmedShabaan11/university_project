import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/button_home_model.dart';
import 'package:university/data/firebase/meet_firebase.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/meet_model.dart';
import 'package:university/data/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../screens/my_profile/my_profile.dart';
import 'button_home.dart';

class StudentHomeComponents extends StatelessWidget {
   StudentHomeComponents({super.key});
  @override
  Widget build(BuildContext context) {
    UserFirebase userFirebase=UserFirebase();

    return Column(
      children: [
//we will divide the screen into two parts
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
//go to profile detail screen here
                      Navigator.pushNamed(
                          context,
                          MyProfileScreens
                              .routeName); //go to profile edit screeen here
                    },
                    child: const CircleAvatar(
                      minRadius: 50.0,
                      maxRadius: 50.0,
                      backgroundColor: kSecondaryColor,
                      backgroundImage:
                          AssetImage('assets/images/student_profile.jpeg'),
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 6,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hi",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w200,
                                    ),
                          ),
                          Text(
                            FirebaseAuth.instance.currentUser!.displayName!,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      Text(
                        'Class X-II A | Roll no:12',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 14.0,
                            ),
                      ),
                      const SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: const Center(
                          child: Text(
                            '2023-2024',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: kTextBlackColor,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
//go to attendance screen  here
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                        color: kOtherColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Degree',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16,
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w800),
                          ),
                          StreamBuilder<QuerySnapshot<UserModel>>(
                            stream: userFirebase.getUser(),
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                UserModel userModel =
                                snapshot.data!.docs.first.data();
                                double getDegree(){
                                  double questionDegree;
                                  double quizDegree=0;
                                  double userDegree=0;
                                  for (var element in userModel.listOfQuizzes!) {
                                    questionDegree=100/element.questionList.length;
                                    for (var element in element.questionList) {
                                      quizDegree+=questionDegree;
                                    }
                                    userDegree=(quizDegree/(100*userModel.listOfQuizzes!.length));
                                  }
                                  return userDegree;
                                }
                                return Text(
                                  "${getDegree()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                      fontSize: 25,
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w300),
                                );
                              }
                              return Text("Degree");
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
//go to attendance screen  here
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                        color: kOtherColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Cost ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16,
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w800),
                          ),
                          Text(
                            '6000\Pound',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontSize: 25,
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot<MeetModel>>(
          stream: MeetFirebase().getAllMeet(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List<MeetModel> listOfMeet =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return listOfMeet.isNotEmpty?ElevatedButton(
                onPressed: () async{
                  if(!await launchUrl(Uri.parse(listOfMeet.first.url))){
                    throw Exception('Could not launch url');
                  }
                },
                child: Text("Go TO Meet"),
              ):SizedBox();
            }
            return SizedBox();

          }
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: listStudentHomeButton.length,
              itemBuilder: (context, index) =>
                  ButtonHome(buttonHomeModel: listStudentHomeButton[index]),
            ),
          ),
        ),
      ],
    );
  }
}
