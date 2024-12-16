class Lesson {
  final int id;
  final String title;
  final String content;
  final int week;
  final int day;

  Lesson({required this.id, required this.title, required this.content, required this.week, required this.day});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      week: json['week'],
      day: json['day'],
    );
  }
}
