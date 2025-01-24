import 'package:flutter/material.dart';
import 'package:mobile_course_app/services/api_services.dart';
import 'package:mobile_course_app/models/lesson.dart';

class ModuleLessonsScreen extends StatefulWidget {
  @override
  _ModuleLessonsScreenState createState() => _ModuleLessonsScreenState();
}

class _ModuleLessonsScreenState extends State<ModuleLessonsScreen> {
  late Future<List<Lesson>> _lessons;
  final ApiService _apiService = ApiService(baseUrl: 'http://localhost:8000/');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final moduleId = ModalRoute.of(context)!.settings.arguments as int;
    _lessons = _apiService.fetchLessonsForModule(moduleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Module Lessons')),
      body: FutureBuilder<List<Lesson>>(
        future: _lessons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No lessons available'));
          }

          return ListView(
            children: snapshot.data!.map((lesson) {
              return Card(
                child: ListTile(
                  title: Text(lesson.title),
                  subtitle: Text('Week ${lesson.week}, Day ${lesson.day}'),
                  onTap: () {
                    Navigator.pushNamed(context, '/lesson_detail', arguments: lesson.id);
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
