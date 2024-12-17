import 'package:flutter/material.dart';
import 'package:mobile_course_app/services/api_services.dart';
import 'package:mobile_course_app/models/lesson.dart';

class LessonDetailScreen extends StatefulWidget {
  @override
  _LessonDetailScreenState createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  late Future<Lesson> _lesson;
  final ApiService _apiService = ApiService(baseUrl: 'http://localhost:8000/api');  // Adjust baseUrl to your backend URL

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final lessonId = ModalRoute.of(context)!.settings.arguments as int;
    _lesson = _apiService.fetchLessonDetail(lessonId);  // Update your API service accordingly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson Detail'),
      ),
      body: FutureBuilder<Lesson>(
        future: _lesson,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No lesson details available'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data!.title, style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 10),
                Text('Week ${snapshot.data!.week}, Day ${snapshot.data!.day}', style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 20),
                Text(snapshot.data!.content, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          );
        },
      ),
    );
  }
}
