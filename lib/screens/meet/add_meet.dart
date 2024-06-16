import 'dart:io';

import 'package:flutter/material.dart';
import 'package:university/componenets/custom_text_formfeild.dart';
import 'package:university/data/firebase/meet_firebase.dart';

class AddMeet extends StatefulWidget {
  static String addMeet="addMeet";
  @override
  State<AddMeet> createState() => _AddMeetState();
}

class _AddMeetState extends State<AddMeet> {
  @override
  MeetFirebase meetFirebase = MeetFirebase();
final formKey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            CustomTextFormField(
              text: "Meet Url",
              controller: meetFirebase.url,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CustomTextFormField(
                    enabled: false,
                    text: "Start Meet",
                    controller: meetFirebase.startController,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    child: Text("Start"),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 365),
                        ),
                      ).then((value) {
                        if (value == null) return;
                        meetFirebase.start=value;
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((v) {
                          if (v == null) return;
                          meetFirebase.startTime = v;
                        });
                        meetFirebase.startController.text =
                            "DATE ${meetFirebase.start?.day} - ${meetFirebase.start?.month} - ${meetFirebase.start?.year} TIME ${meetFirebase.startTime?.hour}:${meetFirebase.startTime?.minute}";
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CustomTextFormField(
                    enabled: false,
                    text: "End Meet",
                    controller: meetFirebase.endController,
                  ),
                ),
                ElevatedButton(
                  child: Text("End"),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                    ).then((value) {
                      if (value == null) return;
                      meetFirebase.end=value;
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((v) {
                        if (v == null) return;
                        meetFirebase.endTime = v;
                      });
                      meetFirebase.endController.text =
                          "DATE ${meetFirebase.end?.day} - ${meetFirebase.end?.month} - ${meetFirebase.end?.year} TIME ${meetFirebase.endTime?.hour}:${meetFirebase.endTime?.minute}";
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    meetFirebase.newMeet();
                    Navigator.pop(context);
                  }

                },
                child: Text("New Meet"))
          ],
        ),
      ),
    );
  }
}
