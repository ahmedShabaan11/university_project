import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  String? text;
  String? regexCondition;
  TextEditingController? controller;
  bool isPassword;
  bool? enabled;
  IconData? iconData;
  Function? onClick;
  TextInputType? keyboardType;
  Function(String)? onChange;
  String? Function(String?)? validator;

  CustomTextFormField({
    this.regexCondition,
    this.text,
    this.controller,
    this.iconData,
    this.onClick,
    this.keyboardType,
    this.isPassword = false,
    this.onChange,
    this.validator,
    this.enabled
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        style: TextStyle(color: Colors.black,fontSize: 18),
        onChanged: onChange,
        validator: validator ??
                (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter $text Currect";
              }
              if (regexCondition != null) {
                if (!RegExp('$regexCondition').hasMatch(value)) {
                  return 'your $text must be $regexCondition';
                }
              }
            },
        enabled: enabled,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          labelText: text!.toUpperCase(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          suffixIcon: iconData != null
              ? InkWell(
            onTap: () {
              onClick!();
            },
            child: Icon(
              iconData,
              // color: ColorManager.darkOrangeColor,
            ),
          )
              : SizedBox(),
        ),
      ),
    );
  }
}