class Progress {
  final int id;
  final int userId;
  final int lessonId;
  final bool completed;
  final String timestamp;

  Progress({required this.id, required this.userId, required this.lessonId, required this.completed, required this.timestamp});

  factory Progress.fromJson(Map<String, dynamic> json) {
    return Progress(
      id: json['id'],
      userId: json['user'],
      lessonId: json['lesson'],
      completed: json['completed'],
      timestamp: json['timestamp'],
    );
  }
}
