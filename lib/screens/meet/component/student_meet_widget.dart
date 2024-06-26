import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:university/data/models/meet_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/firebase/meet_firebase.dart';

class StudentMeetWidget extends StatelessWidget {
  MeetModel meetModel;

  StudentMeetWidget({super.key, required this.meetModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Dr.${meetModel.doctor}"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        '${meetModel.start.year}-${meetModel.start.month}-${meetModel.start.day} ${TimeOfDay(hour: meetModel.start.hour, minute: meetModel.start.minute).format(context)}'),
                    Text('${meetModel.end.year}-${meetModel.end.month}-${meetModel.end.day} ${TimeOfDay(hour: meetModel.end.hour,minute: meetModel.end.minute).format(context)}'),
                    
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (!await launchUrl(Uri.parse(meetModel.url))) {
                      throw Exception('Could not launch url');
                    }
                  },
                  child: const Text("Go TO Meet"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
