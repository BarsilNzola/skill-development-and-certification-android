import 'package:flutter/material.dart';
import 'package:mobile_course_app/screens/home_screen.dart';
import 'package:mobile_course_app/screens/login_signup_screen.dart';
import 'package:mobile_course_app/screens/dashboard_screen.dart';
import 'package:mobile_course_app/screens/edit_profile_screen.dart';
import 'package:mobile_course_app/screens/module_lessons_screen.dart';
import 'package:mobile_course_app/screens/lesson_detail_screen.dart';
import 'package:mobile_course_app/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Code Gears',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/login': (context) => LoginSignupScreen(),
          '/dashboard': (context) => DashboardScreen(),
          '/edit_profile': (context) => EditProfileScreen(),
          '/module_lessons': (context) => ModuleLessonsScreen(),
          '/lesson_detail': (context) => LessonDetailScreen(),
        },
    );
  }
}
