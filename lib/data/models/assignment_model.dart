class QuizModel{
  String id;
  String uid;
  String doctor;
  String subject;
  List<QuestionModel> questionList;
  QuizModel({required this.id,required this.uid,required this.doctor,required this.subject,required this.questionList});
}

class QuestionModel{
  String question;
  List<Answer> chooses;

  QuestionModel({required this.question,required this.chooses});
}

class Answer{
  String text;
  bool isAnswer;
  Answer({required this.text,required this.isAnswer});
}