import 'package:flutter/material.dart';

import '../constants.dart';

class Caht_Bubble extends StatelessWidget {
  const Caht_Bubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 12, top: 16, bottom: 16,),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: kPrimaryColor),
        child: const Text(
          ' I am a new user',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
