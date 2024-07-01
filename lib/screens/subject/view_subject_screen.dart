import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:university/screens/subject/component/list_subject_tile.dart';
import 'package:university/componenets/list_tile_column.dart';
import 'package:university/data/firebase/subject_firbase.dart';
import 'package:university/data/models/subject_model.dart';

class ViewSubject extends StatelessWidget {
   ViewSubject({super.key});

  static String viewSubject = "viewSubject";
  SubjectFirebase subjectFirebase=SubjectFirebase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subjects"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: StreamBuilder<QuerySnapshot<SubjectModel>>(
            stream: subjectFirebase.getAllSubject(),
            builder: (context, snapshot) {
              List<SubjectModel> listOfSubject =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: listOfSubject.length,
                    itemBuilder: (context, index) {
                      return Card(elevation: 15,
                        child: Column(
                          children: [
                            ListTileSubject(
                                title: listOfSubject[index].name,
                                hour: listOfSubject[index].hour.toString()),
                            TextButton(
                              onPressed: () async{
                               await subjectFirebase
                                    .deleteSubject(listOfSubject[index].id);
                              },
                              child:const Text(
                                'remove',
                                style:  TextStyle(
                                    fontSize: 18, color: Colors.red),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
