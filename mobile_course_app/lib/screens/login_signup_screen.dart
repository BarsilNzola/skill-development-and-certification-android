import 'package:flutter/material.dart';
import 'package:mobile_course_app/services/api_services.dart';
import 'package:mobile_course_app/models/user.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final ApiService _apiService = ApiService(baseUrl: 'http://localhost:8000/api'); // Adjust baseUrl to your backend URL

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLogin = true;
  String _errorMessage = '';

  void _toggleFormType() {
    setState(() {
      _isLogin = !_isLogin;
      _errorMessage = '';
    });
  }

  void _authenticate() async {
    try {
      User user;
      if (_isLogin) {
        user = await _apiService.loginUser(
          _usernameController.text,
          _passwordController.text,
        );
      } else {
        user = await _apiService.signupUser(
          _usernameController.text,
          _emailController.text,
          _passwordController.text,
        );
      }
      // Handle successful authentication (e.g., navigate to another screen)
      print('User: ${user.username}');
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            if (!_isLogin)
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text(_isLogin ? 'Login' : 'Sign Up'),
            ),
            TextButton(
              onPressed: _toggleFormType,
              child: Text(_isLogin
                  ? 'Don\'t have an account? Sign up'
                  : 'Already have an account? Login'),
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
