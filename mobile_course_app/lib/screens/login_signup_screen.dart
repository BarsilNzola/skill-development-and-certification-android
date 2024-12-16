import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isLoginForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login / Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoginForm) LoginForm(),
            if (!isLoginForm) SignupForm(),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  isLoginForm = !isLoginForm;
                });
              },
              child: Text(isLoginForm ? 'Sign Up Instead' : 'Login Instead'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Username'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle login
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}

class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Username'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle sign up
          },
          child: Text('Sign Up'),
        ),
      ],
    );
  }
}
