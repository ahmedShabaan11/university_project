import 'package:flutter/material.dart';
import 'package:university/constants.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
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
                  icon,
                  size: 50,
                  color: kTextWhiteColor,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kTextWhiteColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
