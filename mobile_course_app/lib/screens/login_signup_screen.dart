import 'package:flutter/material.dart';
import 'package:mobile_course_app/services/api_services.dart';
import 'package:mobile_course_app/models/user.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService(baseUrl: 'http://localhost:8000/api');  // Adjust baseUrl to your backend URL
  bool _isLoginForm = true;  // Toggle state

  // Login form controllers
  final _loginUsernameController = TextEditingController();
  final _loginPasswordController = TextEditingController();

  // Signup form controllers
  final _signupUsernameController = TextEditingController();
  final _signupEmailController = TextEditingController();
  final _signupPasswordController = TextEditingController();

  void _login() async {
    if (_loginFormKey.currentState!.validate()) {
      try {
        // Perform login API call
        User user = await _apiService.login(
          _loginUsernameController.text,
          _loginPasswordController.text,
        );

        // If successful, navigate to dashboard
        Navigator.pushNamed(context, '/dashboard', arguments: user);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
      }
    }
  }

  void _signup() async {
    if (_signupFormKey.currentState!.validate()) {
      try {
        // Perform signup API call
        User user = await _apiService.signup(
          _signupUsernameController.text,
          _signupEmailController.text,
          _signupPasswordController.text,
        );

        // If successful, navigate to dashboard
        Navigator.pushNamed(context, '/dashboard', arguments: user);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed: $e')));
      }
    }
  }

  void _toggleForm() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Set a light background color
      appBar: AppBar(
        title: Text('Login / Sign Up', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Theme.of(context).colorScheme.secondary, // Set card color to match the button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _isLoginForm ? _buildLoginForm() : _buildSignupForm(),
                ),
              ),
              TextButton(
                onPressed: _toggleForm,
                child: Text(
                  _isLoginForm ? 'Don\'t have an account? Sign Up' : 'Already have an account? Login',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _loginUsernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(color: Colors.white), // Update text color
            ),
            style: TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _loginPasswordController,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white), // Update text color
            ),
            style: TextStyle(color: Colors.white),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login', style: Theme.of(context).textTheme.labelLarge),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor, // Use theme's primary color
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm() {
    return Form(
      key: _signupFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _signupUsernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(color: Colors.white), // Update text color
            ),
            style: TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _signupEmailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white), // Update text color
            ),
            style: TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _signupPasswordController,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white), // Update text color
            ),
            style: TextStyle(color: Colors.white),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _signup,
            child: Text('Sign Up', style: Theme.of(context).textTheme.labelLarge),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor, // Use theme's primary color
            ),
          ),
        ],
      ),
    );
  }
}
