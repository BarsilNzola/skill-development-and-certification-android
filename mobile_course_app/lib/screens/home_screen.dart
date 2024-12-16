import 'package:flutter/material.dart';
import 'package:mobile_course_app/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code Gears'),
      ),
      drawer: NavBar(), // Custom navigation bar widget
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Code Gears!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
