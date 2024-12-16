class Certificate {
  final int id;
  final int userId;
  final int courseId;
  final String dateGenerated;

  Certificate({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.dateGenerated,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      id: json['id'],
      userId: json['user'],
      courseId: json['course'],
      dateGenerated: json['date_generated'],
    );
  }
}
