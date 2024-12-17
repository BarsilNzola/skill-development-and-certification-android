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

  Future<User> signup(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to sign up');
    }
  }

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
    
  Future<List<Module>> fetchUserModules(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId/modules/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Module.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load user modules');
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

  Future<List<Lesson>> fetchLessonsForModule(int moduleId) async {
    final response = await http.get(Uri.parse('$baseUrl/modules/$moduleId/lessons/'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Lesson.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load lessons for module');
    }
  }

  Future<Lesson> fetchLessonDetail(int lessonId) async {
    final response = await http.get(Uri.parse('$baseUrl/lessons/$lessonId/'));

    if (response.statusCode == 200) {
      return Lesson.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load lesson details');
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
