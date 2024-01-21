import 'package:flutter/material.dart';
import 'package:university/constants.dart';

class ListTileColumn extends StatelessWidget {
  const ListTileColumn({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontSize: 15, color: kTextLightColor, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        value,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontSize: 15, color: kTextBlackColor, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        Icons.lock_outline,
        size: 20,
      ),
    );
  }
}
