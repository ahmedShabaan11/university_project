import 'package:flutter/material.dart';
import 'package:university/componenets/button_home.dart';
import 'package:university/constants.dart';
import 'package:university/screens/chat_screen/chat_screen.dart';
import 'package:university/screens/my_profile/my_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //we will divide the screen into two parts
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height / 2.5,
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
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            Text(
                              "Sally",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
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
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
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
                            borderRadius:
                            BorderRadius.circular(kDefaultPadding),
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2.5,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 9,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Attendance',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                  fontSize: 16,
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '95.09%',
                              style: Theme
                                  .of(context)
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
                    InkWell(
                      onTap: () {
                        //go to attendance screen  here
                      },
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2.5,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 9,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Cost ',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                  fontSize: 16,
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '6000\Pound',
                              style: Theme
                                  .of(context)
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
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(),
                ),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const ButtonHome(
                              title: 'Take Quiz',
                              icon: Icons.quiz,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const ButtonHome(
                              title: 'Discussion From',
                              icon: Icons.holiday_village,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const ButtonHome(
                              title: 'Result',
                              icon: Icons.ac_unit,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const ButtonHome(
                              title: 'Assigments',
                              icon: Icons.assignment_add,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (_)
                              {
                                return  Chat_Screen();
                              }),
                              );
                            },
                            child: const ButtonHome(
                              title: 'Chat',
                              icon: Icons.format_align_justify_rounded,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const ButtonHome(
                              title: 'Courses',
                              icon: Icons.data_array,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
