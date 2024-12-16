import 'package:flutter/material.dart';
import 'package:mobile_course_app/widgets/navbar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: NavBar(), // Custom navigation bar widget
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, Username!',
                style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(height: 20),
            Text('Your Modules',
                style: TextStyle(fontSize: 20, color: Color(0xFF004466))),
            SizedBox(height: 10),
            // Add List of Module Cards Here
            SizedBox(height: 20),
            Text('Free Learning Resources',
                style: TextStyle(fontSize: 20, color: Color(0xFF004466))),
            SizedBox(height: 10),
            // Add List of Learning Resources Here
          ],
        ),
      ),
    );
  }
}
