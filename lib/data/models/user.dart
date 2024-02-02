import 'package:university/core/key_manager.dart';
import 'package:university/data/firebase/user_firebase.dart';

class user {
  String firstName;
  String lastName;
  String idStu;
  String password;
  String phone;
  String email;

  user(
      {required this.email,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.idStu,
      required this.password});

  factory user.fromJsonU(Map<String, dynamic> jsonData) {
    return user(
      email: jsonData[JsonKeyManager.email],
      phone: jsonData[JsonKeyManager.phone],
      firstName: jsonData[JsonKeyManager.firstName],
      lastName: jsonData[JsonKeyManager.lastName],
      idStu: jsonData[JsonKeyManager.idStu],
      password: jsonData[JsonKeyManager.passowrd],
    );
  }

  Map<String, dynamic> toJsonU() {
    return {
      JsonKeyManager.email: email,
      JsonKeyManager.idStu: idStu,
      JsonKeyManager.lastName: lastName,
      JsonKeyManager.passowrd: password,
      JsonKeyManager.firstName: firstName,
      JsonKeyManager.phone: phone,
    };
  }
}
