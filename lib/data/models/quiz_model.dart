import 'dart:convert';

import 'package:university/core/key_manager.dart';

class QuizModel {
  String id;
  String uid;
  String doctor;
  String subject;
  List<QuestionModel> questionList;

  QuizModel(
      {required this.id,
      required this.uid,
      required this.doctor,
      required this.subject,
      required this.questionList});

  QuizModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json[JsonKeyManager.id],
          uid: json[JsonKeyManager.uid],
          doctor: json[JsonKeyManager.doctor],
          subject: json[JsonKeyManager.subject],
          questionList: List<QuestionModel>.from(
              (jsonDecode(json[JsonKeyManager.questionList]))
                  .map((e) => QuestionModel.fromJson(e))).toList(),
        );

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.id: id,
      JsonKeyManager.uid: uid,
      JsonKeyManager.doctor: doctor,
      JsonKeyManager.subject: subject,
      JsonKeyManager.questionList: jsonEncode(
          List<QuestionModel>.from(questionList ?? [])
              .map((e) => e.toJson())
              .toList()),
    };
  }
}

class QuestionModel {
  String question;
  List<Answer> chooses;

  QuestionModel({required this.question, required this.chooses});

  QuestionModel.fromJson(Map<String, dynamic> json)
      : this(
          question: json[JsonKeyManager.question],
          chooses: List<Answer>.from((jsonDecode(json[JsonKeyManager.chooses]))
              .map((e) => Answer.fromJson(e))).toList(),
        );

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.question: question,
      JsonKeyManager.chooses: jsonEncode(
          List<Answer>.from(chooses ?? []).map((e) => e.toJson()).toList())
    };
  }
}

class Answer {
  String text;
  bool isAnswer;

  Answer({required this.text, required this.isAnswer});

  Answer.fromJson(Map<String, dynamic> json)
      : this(
          text: json[JsonKeyManager.text],
          isAnswer: json[JsonKeyManager.isAnswer],
        );

  Map<String, dynamic> toJson() {
    return {
      JsonKeyManager.text: text,
      JsonKeyManager.isAnswer: isAnswer,
    };
  }
}
