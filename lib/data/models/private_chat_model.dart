import 'package:university/core/key_manager.dart';

class PrivateChatModel {
  String id;
  String from;
  String to;

  PrivateChatModel({required this.id, required this.from, required this.to});

  PrivateChatModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json[JsonKeyManager.id],
            from: json[JsonKeyManager.from],
            to: json[JsonKeyManager.to]);

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.id: id,
      JsonKeyManager.to: to,
      JsonKeyManager.from: from
    };
  }
}
