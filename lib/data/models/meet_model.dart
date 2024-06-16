import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university/core/key_manager.dart';

class MeetModel {
  String url;
  String id;
  String uid;
  String doctor;
  DateTime start;

  DateTime end;

  MeetModel({
    required this.uid,
    required this.doctor,
    required this.start,
    required this.end,
    this.id = "",
    required this.url,
  });

  MeetModel.fromJson(Map<String, dynamic> json)
      : this(
    doctor: json[JsonKeyManager.doctor],
          uid: json[JsonKeyManager.uid],
          start: (json[JsonKeyManager.start] as Timestamp).toDate(),
          end: (json[JsonKeyManager.end] as Timestamp).toDate(),
          id: json[JsonKeyManager.id],
          url: json[JsonKeyManager.url],
        );

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.id: id,
      JsonKeyManager.url: url,
      JsonKeyManager.start: start,
      JsonKeyManager.end: end,
      JsonKeyManager.uid: uid,
      JsonKeyManager.doctor:doctor
    };
  }
}
