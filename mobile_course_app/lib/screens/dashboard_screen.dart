import 'package:flutter/material.dart';
import 'package:mobile_course_app/services/api_services.dart';
import 'package:mobile_course_app/models/module.dart';
import 'package:mobile_course_app/models/user.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<List<Module>> _modules;
  final ApiService _apiService = ApiService(baseUrl: 'http://localhost:8000/');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve user from the navigation arguments
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    // Fetch modules (no user ID required in the updated service)
    _modules = _apiService.fetchModules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Module>>(
        future: _modules,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No modules available'));
          }

          // Render list of modules
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final module = snapshot.data![index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Image.network(
                    module.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    module.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(module.description),
                  onTap: () {
                    // Navigate to module lessons screen
                    Navigator.pushNamed(
                      context,
                      '/module_lessons',
                      arguments: module.id,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
