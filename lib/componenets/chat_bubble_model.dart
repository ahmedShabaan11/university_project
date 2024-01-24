import 'package:flutter/material.dart';
import 'package:university/models/messages.dart';

import '../constants.dart';

class Caht_Bubble extends StatelessWidget {
  Caht_Bubble({
    Key? key,
     required this.message,

  }) : super(key: key);

 final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 12,
          top: 16,
          bottom: 16,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: kPrimaryColor),
        child:  Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Caht_Bubble_re extends StatelessWidget {
  Caht_Bubble_re({
    Key? key,
    required this.message,

  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 12,
          top: 16,
          bottom: 16,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: Colors.amber),
        child:  Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
