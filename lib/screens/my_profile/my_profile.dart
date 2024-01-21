import 'package:flutter/material.dart';
import 'package:university/componenets/list_tile_column.dart';
import 'package:university/componenets/profiledetailrow.dart';
import 'package:university/constants.dart';

class MyProfileScreens extends StatelessWidget {
  const MyProfileScreens({super.key});

  static String routeName = 'MyProfileScreens';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          InkWell(
            onTap: () {
              //send Report  to university  managment ,in case if you want some changes to your profile
            },
            child: Container(
              padding: const EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  const Icon(Icons.report_gmailerrorred_outlined),
                  kHalfWidthSizedBox,
                  Text(
                    'Report ',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kOtherColor,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 110,
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(kDefaultPadding * 2),
                    bottomLeft: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      maxRadius: 50,
                      minRadius: 50,
                      backgroundColor: kSecondaryColor,
                      backgroundImage:
                          AssetImage('assets/images/student_profile.jpeg'),
                    ),
                    kWidthSizedBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sally Ahmed',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Class X-II A | Roll no:12',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 14.0),
                        )
                      ],
                    )
                  ],
                ),
              ),
              sizedBox,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: "Registration Number ", value: '2023-ASDF-2024 '),
                  ProfileDetailRow(
                      title: " Acdemic Year  ", value: '2023-2024 '),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(title: "Admission Class ", value: 'X-II '),
                  ProfileDetailRow(
                      title: " Admission Number ", value: '001451'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: "Date of Admission ", value: '1 Aug 2024'),
                  ProfileDetailRow(
                      title: " Date of Birth  ", value: '7 May 2000'),
                ],
              ),
              sizedBox,
              const ListTileColumn(
                title: 'Email',
                value: 'sallyahmd@gamil.com',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(
                  thickness: 2.0,
                ),
              ),
              const ListTileColumn(
                title: 'Father Name',
                value: 'Ahmed Mas',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(
                  thickness: 2.0,
                ),
              ),
              const ListTileColumn(
                title: 'Mother Name',
                value: 'Angelica',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(
                  thickness: 2.0,
                ),
              ),
              const ListTileColumn(
                title: 'Phone Number',
                value: '01555498432',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(
                  thickness: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
