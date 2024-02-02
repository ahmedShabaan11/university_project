import 'package:university/core/key_manager.dart';

class MessageModel {
  String name;
  String? id;
  String message;
  String uid;

  MessageModel({this.id,required this.name
    ,required this.uid,
    required this.message});

  factory MessageModel.fromJson(Map<String, dynamic> jsonData) {
    return MessageModel(
     name: jsonData[JsonKeyManager.name],
        uid:  jsonData[JsonKeyManager.uid],
        message: jsonData[JsonKeyManager.message],id: jsonData[JsonKeyManager.id]);
  }

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.name:name,
      JsonKeyManager.id:id,
      JsonKeyManager.uid: uid,
      JsonKeyManager.message: message,
      JsonKeyManager.createdAt: DateTime.now()
    };
  }
}
