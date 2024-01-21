import 'package:flutter/material.dart';
import 'package:university/constants.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: kDefaultPadding / 4,
        left: kDefaultPadding / 4,
        top: kDefaultPadding / 2,
      ),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: kTextLightColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: kTextBlackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.lock_outlined,
            size: 20,
          ),
        ],
      ),
    );
  }
}
