import 'package:flutter/material.dart';
import 'package:university/constants.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;

  const DefaultButton(
      {super.key,
      required this.onPress,
      required this.title,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(
            right: kDefaultPadding, left: kDefaultPadding),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kPrimaryColor, kSecondaryColor],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
            ),
            const Spacer(),
            Icon(iconData),
          ],
        ),
      ),
    );
  }
}
