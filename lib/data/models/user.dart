import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university/core/key_manager.dart';
import 'package:university/data/models/quiz_model.dart';

class UserModel {
  String firstName;
  String lastName;
  String? idStu;
  String? uid;
  String password;
  String phone;
  String email;
  String type;
  List<UserModel> connections;
  List<QuizModel>? listOfQuizzes;

  UserModel(
      {this.uid,
      required this.email,
      required this.phone,
      required this.firstName,
      required this.lastName,
      this.idStu,
      this.password = "",
      required this.type,
      required this.connections,this.listOfQuizzes});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      uid: jsonData[JsonKeyManager.uid],
      email: jsonData[JsonKeyManager.email],
      phone: jsonData[JsonKeyManager.phone],
      firstName: jsonData[JsonKeyManager.firstName],
      lastName: jsonData[JsonKeyManager.lastName],
      idStu: jsonData[JsonKeyManager.idStu],
      password: jsonData[JsonKeyManager.password],
      type: jsonData[JsonKeyManager.type],
      connections: List<UserModel>.from(
          (jsonDecode(jsonData[JsonKeyManager.connections]))
              .map((e) => UserModel.fromJson(e))).toList(),
      listOfQuizzes: List<QuizModel>.from(
          (jsonDecode(jsonData[JsonKeyManager.quizzes]))
              .map((e) => QuizModel.fromJson(e))).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.email: email,
      JsonKeyManager.idStu: idStu,
      JsonKeyManager.lastName: lastName,
      JsonKeyManager.password: password,
      JsonKeyManager.firstName: firstName,
      JsonKeyManager.phone: phone,
      JsonKeyManager.uid: uid,
      JsonKeyManager.type: type,
      JsonKeyManager.connections: jsonEncode(
          List<UserModel>.from(connections)
              .map((e) => e.toJson())
              .toList()),JsonKeyManager.quizzes: jsonEncode(
          List<QuizModel>.from(listOfQuizzes ?? [])
              .map((e) => e.toJson())
              .toList()),
    };
  }
}
