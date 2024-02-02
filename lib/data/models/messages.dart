import 'package:university/core/key_manager.dart';

class Message {
  String name;
  String? id;
  String message;
  String uid;

  Message({this.id,required this.name
    ,required this.uid,
    required this.message});

  factory Message.fromJson(Map<String, dynamic> jsonData) {
    return Message(
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
