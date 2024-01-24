import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:university/models/chat_model.dart';
import 'package:university/models/chat_model.dart';

class ButtonHome extends StatelessWidget {
   ButtonHome({super.key, required this.ButtonHomeModel});

 buttonHomeModel ButtonHomeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ButtonHomeModel.onTap(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 5.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              ButtonHomeModel.icon,
              color: kTextWhiteColor,
            ),
            Text(
              ButtonHomeModel.title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kTextWhiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
