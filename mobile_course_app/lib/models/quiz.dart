class Quiz {
  final int id;
  final int lessonId;
  final String title;

  Quiz({required this.id, required this.lessonId, required this.title});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      lessonId: json['lesson'],
      title: json['title'],
    );
  }
}
