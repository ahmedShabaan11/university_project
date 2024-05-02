import 'package:university/core/key_manager.dart';
import 'package:university/data/firebase/user_firebase.dart';

class UserModel {
  String firstName;
  String lastName;
  String? idStu;
  String? uid;
  String password;
  String phone;
  String email;
  String type;

  UserModel(
      { this.uid,
      required this.email,
      required this.phone,
      required this.firstName,
      required this.lastName,
       this.idStu,
      required this.password,required this.type});

  factory UserModel.fromJsonU(Map<String, dynamic> jsonData) {
    return UserModel(
      uid: jsonData[JsonKeyManager.uid],
      email: jsonData[JsonKeyManager.email],
      phone: jsonData[JsonKeyManager.phone],
      firstName: jsonData[JsonKeyManager.firstName],
      lastName: jsonData[JsonKeyManager.lastName],
      idStu: jsonData[JsonKeyManager.idStu],
      password: jsonData[JsonKeyManager.password],
      type: jsonData[JsonKeyManager.type]
    );
  }

  Map<String, dynamic> toJsonU() {
    return {
      JsonKeyManager.email: email,
      JsonKeyManager.idStu: idStu,
      JsonKeyManager.lastName: lastName,
      JsonKeyManager.password: password,
      JsonKeyManager.firstName: firstName,
      JsonKeyManager.phone: phone,
      JsonKeyManager.uid: uid,
      JsonKeyManager.type: type,
    };
  }
}
