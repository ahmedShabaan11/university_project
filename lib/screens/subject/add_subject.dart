import 'package:flutter/material.dart';
import 'package:university/componenets/custom_text_formfeild.dart';
import 'package:university/data/firebase/subject_firbase.dart';

class AddSubject extends StatefulWidget {
  AddSubject({super.key});

  static String addSubject = "addSubject";
  // final formKey = GlobalKey<FormState>();

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  SubjectFirebase subjectFirebase = SubjectFirebase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("New Subject"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: subjectFirebase.formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        text: "Subject Name",
                        controller: subjectFirebase.name,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                        text: "Subject Hour",
                        controller: subjectFirebase.hour,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if ( subjectFirebase.formKey.currentState!.validate()) {
                            subjectFirebase.newSubject();
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Add Subject"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
