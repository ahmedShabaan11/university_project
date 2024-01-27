import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormFeild extends StatelessWidget {
  String hintText;
  String ?labelText;
  IconData? icon;
  bool obscureText;
  void Function()? onTap;
  TextEditingController? controller;
  TextInputType? keyboardType;

  CustomTextFormFeild({
    super.key,
    required this.hintText,
    this.icon,
    this.onTap,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (value) {
        RegExp regExp = RegExp(controller!.text);
        if (value == null || value.isEmpty) {
          return 'please Enter correct input';
        } else if (!regExp.hasMatch(value)) {
          return 'Please Enter a valid input ';
        }
      },
      style: const TextStyle(color: Colors.black, fontSize: 20),
      controller: controller,
      obscureText: obscureText,
textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        filled: false,
        fillColor: Colors.white,
        labelText:labelText,

        isDense: true,
        hintText: hintText,
        suffixIcon: icon == null
            ? const SizedBox()
            : InkWell(
                child: Icon(icon),
                onTap: onTap,
              ),

        suffixStyle: const TextStyle(decoration: TextDecoration.lineThrough),
        border: OutlineInputBorder(


          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

}
