import 'package:flutter/material.dart';
import 'package:university/componenets/custom_text_formfeild.dart';

class NewAnswerWidget extends StatefulWidget {
  NewAnswerWidget(
      {super.key,
      required this.groupValue,
      required this.onChanged,
      required this.value,
      required this.onPressed,
      required this.controller});

  String value;
  String? groupValue;
  void Function()? onPressed;
  TextEditingController controller;
  void Function(String?)? onChanged;

  @override
  State<NewAnswerWidget> createState() => _NewAnswerWidgetState();
}

class _NewAnswerWidgetState extends State<NewAnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Radio(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
          Expanded(
            // width: MediaQuery.of(context).size.width * 0.6,
            child: CustomTextFormField(
                text: "Enter Answer", controller: widget.controller,maxLines: null,),
          ),
          TextButton(onPressed: widget.onPressed, child: Text("remove"))
        ],
      ),
    );
  }
}
