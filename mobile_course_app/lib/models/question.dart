class Question {
  final int id;
  final int quizId;
  final String text;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Question({required this.id, required this.quizId, required this.text, required this.correctAnswer, required this.incorrectAnswers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      quizId: json['quiz'],
      text: json['text'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: json['incorrect_answers'],
    );
  }
}
