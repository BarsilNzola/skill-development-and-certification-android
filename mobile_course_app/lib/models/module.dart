class Module {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Module({required this.id, required this.title, required this.description, required this.imageUrl});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],  // Adjust field names as per your API response
    );
  }
}
