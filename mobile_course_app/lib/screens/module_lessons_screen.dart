import 'package:flutter/material.dart';

class ModuleLessonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module Lessons'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Module Title', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Dashboard'),
            ),
            SizedBox(height: 20),
            // Add weeks and lessons here
          ],
        ),
      ),
    );
  }
}
