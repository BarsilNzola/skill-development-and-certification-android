import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_course_app/models/course.dart';
import 'package:mobile_course_app/models/module.dart';
import 'package:mobile_course_app/models/lesson.dart';
import 'package:mobile_course_app/models/progress.dart';
import 'package:mobile_course_app/models/quiz.dart';
import 'package:mobile_course_app/models/question.dart';
import 'package:mobile_course_app/models/assignment.dart';
import 'package:mobile_course_app/models/certificate.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse('$baseUrl/courses/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Course.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<List<Module>> fetchModules() async {
    final response = await http.get(Uri.parse('$baseUrl/modules/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Module.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load modules');
    }
  }

  Future<List<Lesson>> fetchLessons() async {
    final response = await http.get(Uri.parse('$baseUrl/lessons/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Lesson.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load lessons');
    }
  }

  Future<List<Progress>> fetchProgresses() async {
    final response = await http.get(Uri.parse('$baseUrl/progresses/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Progress.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load progresses');
    }
  }

  Future<List<Quiz>> fetchQuizzes() async {
    final response = await http.get(Uri.parse('$baseUrl/quizzes/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Quiz.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load quizzes');
    }
  }

  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse('$baseUrl/questions/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Question.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }

  Future<List<Assignment>> fetchAssignments() async {
    final response = await http.get(Uri.parse('$baseUrl/assignments/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Assignment.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load assignments');
    }
  }

  Future<List<Certificate>> fetchCertificates() async {
    final response = await http.get(Uri.parse('$baseUrl/certificates/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Certificate.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load certificates');
    }
  }
}