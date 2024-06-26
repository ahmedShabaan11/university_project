import 'package:flutter/material.dart';
import 'package:university/constants.dart';
import 'package:university/data/models/meet_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/firebase/meet_firebase.dart';

class MeetWidget extends StatelessWidget {
  MeetModel meetModel;

  MeetWidget({super.key, required this.meetModel});

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
                    Text('${meetModel.start}'),
                    Text('${meetModel.end}'),
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
                ElevatedButton(
                  onPressed: () async {
                    MeetFirebase().deleteMeet(meetModel.id);
                  },
                  child: const Text("Delete Meet"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

