import 'package:flutter/material.dart';
import 'package:mobile_course_app/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Light background color
      appBar: AppBar(
        title: Text('Code Gears', style: Theme.of(context).textTheme.headlineSmall),
      ),
      drawer: NavBar(), // Custom navigation bar widget
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Code Gears!',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white) ?? 
                        const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Unlock your potential with Code Gears, the ultimate destination for personalized learning and growth.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Get Started', style: Theme.of(context).textTheme.labelLarge),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary, // Use theme's secondary color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
