class Questions {
  final int question_id;
  final String question;
  final int level_id;
  final int user_id;
  final String status;
  final int Question_id;
  final String choice_1;
  final String choice_2;
  final String choice_3;
  final String choice_4;
  final String answer;

  Questions({
    required this.question_id,
    required this.question,
    required this.level_id,
    required this.user_id,
    required this.status,
    required this.Question_id,
    required this.choice_1,
    required this.choice_2,
    required this.choice_3,
    required this.choice_4,
    required this.answer,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
        question_id: json['question_id'],
        question: json['question'],
        level_id: json['level_id'],
        user_id: json['user_id'],
        status: json['status'],
        Question_id: json['Question_id'],
        choice_1: json['choice_1'],
        choice_2: json['choice_2'],
        choice_3: json['choice_3'],
        choice_4: json['choice_4'],
        answer: json['Answer']);
  }
}
