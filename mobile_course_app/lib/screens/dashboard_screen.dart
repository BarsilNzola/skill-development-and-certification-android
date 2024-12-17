import 'package:flutter/material.dart';
import 'package:mobile_course_app/services/api_services.dart';
import 'package:mobile_course_app/models/module.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<List<Module>> _modules;
  final ApiService _apiService = ApiService(baseUrl: 'http://localhost:8000/api');  // Adjust baseUrl to your backend URL

  @override
  void initState() {
    super.initState();
    _modules = _apiService.fetchModules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Code Gears',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF004466),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login / Sign Up'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Module>>(
        future: _modules,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No modules available'));
          }

          return ListView(
            children: snapshot.data!.map((module) {
              return Card(
                child: ListTile(
                  leading: Image.network(module.imageUrl),  // Ensure your API provides the full URL for images
                  title: Text(module.title),
                  subtitle: Text(module.description),
                  onTap: () {
                    Navigator.pushNamed(context, '/module_lessons', arguments: module.id);
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
