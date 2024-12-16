import 'package:flutter/material.dart';

class LessonDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: 0.5,  // Update this with actual progress
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF004466)),
              ),
              SizedBox(height: 20),
              Text('Lesson Title', style: TextStyle(fontSize: 24)),
              Text('Week 1, Day 1', style: TextStyle(fontSize: 16, color: Colors.grey)),
              SizedBox(height: 20),
              Text(
                'Lesson content goes here...',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              if (true)  // Replace with condition to check if it's Day 5
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'GitHub Repository Link',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle assignment submission
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle marking lesson as completed
                },
                child: Text('Mark as Completed'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle downloading certificate
                },
                child: Text('Download Certificate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
