
class AssignmentModel{
  String question;
  List<Answer> chooses;

  AssignmentModel({required this.question,required this.chooses});
}

class Answer{

  String text;
  bool isAnswer;

  Answer({required this.text,required this.isAnswer});
}