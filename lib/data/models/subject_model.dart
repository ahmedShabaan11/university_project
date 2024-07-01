import 'package:university/core/key_manager.dart';

class SubjectModel {
  num hour;
  String name;
  String id;

  SubjectModel({required this.hour, required this.name, required this.id});

  SubjectModel.fromJson(Map<String, dynamic> json)
      : this(
          hour: json[JsonKeyManager.hour],
          name: json[JsonKeyManager.name],
          id: JsonKeyManager.id,
        );

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.name: name,
      JsonKeyManager.id: id,
      JsonKeyManager.hour: hour,
    };
  }
}
