import 'package:university/core/key_manager.dart';

class PrivateChatModel {
  String id;
  String from;
  String to;
  String name;
  String type;

  PrivateChatModel(
      {required this.id,
      required this.from,
      required this.to,
      required this.name,
      required this.type});

  PrivateChatModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json[JsonKeyManager.id],
            from: json[JsonKeyManager.from],
            to: json[JsonKeyManager.to],
            name: json[JsonKeyManager.name],
            type: json[JsonKeyManager.type]);

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.id: id,
      JsonKeyManager.to: to,
      JsonKeyManager.from: from,
      JsonKeyManager.name: name,
      JsonKeyManager.type: type,
      JsonKeyManager.createdAt: DateTime.now(),
    };
  }
}
