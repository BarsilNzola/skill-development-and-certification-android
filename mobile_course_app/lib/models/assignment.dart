class Assignment {
  final int id;
  final String title;
  final String description;
  final String dueDate;
  final int courseId;
  final int moduleId;
  final int lessonId;
  final int? submittedById;
  final String? githubLink;
  final String? submittedAt;

  Assignment({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.courseId,
    required this.moduleId,
    required this.lessonId,
    this.submittedById,
    this.githubLink,
    this.submittedAt,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: json['due_date'],
      courseId: json['course'],
      moduleId: json['module'],
      lessonId: json['lesson'],
      submittedById: json['submitted_by'],
      githubLink: json['github_link'],
      submittedAt: json['submitted_at'],
    );
  }
}
