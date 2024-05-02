import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:university/componenets/imagepickr.dart';
import 'package:university/componenets/list_tile_column.dart';
import 'package:university/componenets/profiledetailrow.dart';
import 'package:university/constants.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/firebase/user_firebase.dart';
import 'package:university/data/models/user.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyProfileScreens extends StatelessWidget {
  MyProfileScreens({
    super.key,
  });

  static String routeName = 'MyProfileScreens';

  UserModel? userModel;
  ImagePickModel? imagePickModel;

  @override
  Widget build(BuildContext context) {
    CollectionReference Users = FirebaseFirestore.instance.collection('Users');
    UserFirebase().getUser().then(
      (value) {
        userModel = value.docs.first.data();
      },
    );
    return Scaffold(
              appBar: AppBar(
                title: const Text('My Profile'),
                actions: [
                  InkWell(
                    onTap: () {
                      //send Report  to university  managment ,in case if you want some changes to your profile
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: kDefaultPadding / 2),
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
              body:
              FutureBuilder<DocumentSnapshot>(
                future: Users.doc().get(),
                builder: (BuildContext context, snapshot) =>
                    SingleChildScrollView(
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
                            // InkWell(
                            //   onTap: imagePickModel!.uploadImage(),
                            //   child:  const CircleAvatar(
                            //     maxRadius: 50,
                            //     minRadius: 50,
                            //     backgroundColor: kSecondaryColor,
                            //     backgroundImage:  AssetImage(
                            //         'assets/images/blank-profile-picture-973460_1280.png'),
                            //   ),
                            // ),
                            kWidthSizedBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "hi ${FirebaseAuth.instance.currentUser!.displayName!}",
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
                            ),
                          ],
                        ),
                      ),
                      sizedBox,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileDetailRow(
                              title: "Registration Number ",
                              value: '2023-ASDF-2024 '),
                          ProfileDetailRow(
                              title: " Acdemic Year  ", value: '2023-2024 '),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileDetailRow(
                              title: "Admission Class ", value: 'X-II '),
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
                      ListTileColumn(
                        title: 'Email',
                        value:
                            FirebaseAuth.instance.currentUser!.email.toString(),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Divider(
                          thickness: 2.0,
                        ),
                      ),
                      ListTileColumn(
                        title: 'First Name',
                        value: FirebaseAuth.instance.currentUser!.displayName!
                            .split(' ')[0],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Divider(
                          thickness: 2.0,
                        ),
                      ),
                      ListTileColumn(
                        title: 'Father Name',
                        value: FirebaseAuth.instance.currentUser!.displayName!
                            .split(' ')[1],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Divider(
                          thickness: 2.0,
                        ),
                      ),
                      ListTileColumn(
                        title: 'Id',
                        value: FirebaseAuth.instance.currentUser!.uid,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Divider(
                          thickness: 2.0,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Divider(
                          thickness: 2.0,
                        ),
                      ),
                      ListTileColumn(
                        title: 'Phone Number',
                        value: userModel!.phone,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
