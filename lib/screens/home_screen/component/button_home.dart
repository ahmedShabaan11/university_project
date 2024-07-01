import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:university/data/models/button_home_model.dart';


class ButtonHome extends StatelessWidget {
   ButtonHome({super.key, required this.buttonHomeModel});

 ButtonHomeModel buttonHomeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => buttonHomeModel.onTap(context),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 5.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              buttonHomeModel.icon,
              color: kTextWhiteColor,
            ),
            Text(
              buttonHomeModel.title,
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
