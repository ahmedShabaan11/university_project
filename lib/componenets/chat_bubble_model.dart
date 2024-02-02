import 'package:flutter/material.dart';
import 'package:university/data/models/messages.dart';

import '../constants.dart';

class Caht_Bubble extends StatelessWidget {
  Caht_Bubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
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
          child: Column(
            children: [
               Text(
              message.name,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                message.message,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Caht_Bubble_re extends StatelessWidget {
  Caht_Bubble_re({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
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
                bottomLeft: Radius.circular(32)),
            color: Colors.white),
        child: Text(
          message.message,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
