import 'package:flutter/material.dart';
import 'package:mobile_course_app/services/api_services.dart';
import 'package:mobile_course_app/models/user.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService(baseUrl: 'http://localhost:8000/api');
  bool _isLogin = true;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        if (_isLogin) {
          User user = await _apiService.login(
            _usernameController.text,
            _passwordController.text,
          );
          Navigator.pushNamed(context, '/dashboard', arguments: user);
        } else {
          if (_passwordController.text != _confirmPasswordController.text) {
            throw Exception('Passwords do not match');
          }
          await _apiService.signup(
            _usernameController.text,
            _emailController.text,
            _passwordController.text,
            _confirmPasswordController.text,
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Signup successful! Please log in.')));
          setState(() => _isLogin = true);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  Widget _buildTextField(
      {required String label,
      required TextEditingController controller,
      bool obscure = false,
      String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      obscureText: obscure,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? 'Login' : 'Sign Up')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (!_isLogin)
                  _buildTextField(
                    label: 'Email',
                    controller: _emailController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                  ),
                _buildTextField(
                  label: 'Username',
                  controller: _usernameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your username' : null,
                ),
                _buildTextField(
                  label: 'Password',
                  controller: _passwordController,
                  obscure: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your password' : null,
                ),
                if (!_isLogin)
                  _buildTextField(
                    label: 'Confirm Password',
                    controller: _confirmPasswordController,
                    obscure: true,
                    validator: (value) => value!.isEmpty
                        ? 'Please confirm your password'
                        : null,
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_isLogin ? 'Login' : 'Sign Up'),
                ),
                TextButton(
                  onPressed: () => setState(() => _isLogin = !_isLogin),
                  child: Text(_isLogin
                      ? 'Don\'t have an account? Sign Up'
                      : 'Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
