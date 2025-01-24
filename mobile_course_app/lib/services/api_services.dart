import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_course_app/models/user.dart';
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

  // Login
  Future<User> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  // Signup
  Future<User> signup(
      String username, String email, String password, String confirmPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
      }),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to sign up');
    }
  }

  // Fetch Courses
  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse('$baseUrl/courses/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Course.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  // Fetch Modules
  Future<List<Module>> fetchModules() async {
    final response = await http.get(Uri.parse('$baseUrl/modules/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Module.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load modules');
    }
  }

  // Fetch Lessons for a Module
  Future<List<Lesson>> fetchLessonsForModule(int moduleId) async {
    final response = await http.get(Uri.parse('$baseUrl/module/$moduleId/lessons/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Lesson.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load lessons for module');
    }
  }

  // Fetch Lesson Detail
  Future<Lesson> fetchLessonDetail(int lessonId) async {
    final response = await http.get(Uri.parse('$baseUrl/lesson/$lessonId/'));

    if (response.statusCode == 200) {
      return Lesson.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load lesson details');
    }
  }

  // Fetch Progress
  Future<List<Progress>> fetchProgresses() async {
    final response = await http.get(Uri.parse('$baseUrl/progress/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Progress.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load progresses');
    }
  }

  // Fetch Quizzes
  Future<List<Quiz>> fetchQuizzes() async {
    final response = await http.get(Uri.parse('$baseUrl/quizzes/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Quiz.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load quizzes');
    }
  }

  // Fetch Questions
  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse('$baseUrl/questions/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Question.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }

  // Fetch Assignments
  Future<List<Assignment>> fetchAssignments() async {
    final response = await http.get(Uri.parse('$baseUrl/assignments/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Assignment.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load assignments');
    }
  }

  // Fetch Certificates
  Future<List<Certificate>> fetchCertificates(int courseId, int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/certificate/$courseId/$userId/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Certificate.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load certificates');
    }
  }
}
