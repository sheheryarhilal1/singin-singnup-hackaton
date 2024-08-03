import 'package:app/home_page.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isSignIn = true; // Tracks whether the sign-in form is visible

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _signIn() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar("Please fill in all fields.");
      return;
    }

    _showSnackBar("Signed in successfully!");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void _signUp() {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      _showSnackBar("Please fill in all fields.");
      return;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      _showSnackBar("Passwords do not match.");
      return;
    }

    _showSnackBar("Signed up successfully!");

    setState(() {
      _isSignIn = true;

      _confirmPasswordController.clear();
    });
  }

  void _resetPassword() {
    _showSnackBar("Password reset link sent!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Singin'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_isSignIn) ...[
                  _buildForm(
                    title: 'Sign In',
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: null,
                    onSubmit: _signIn,
                    showConfirmPassword: false,
                    resetPassword: _resetPassword,
                  ),
                ],
                if (!_isSignIn) ...[
                  _buildForm(
                    title: 'Sign Up',
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    onSubmit: _signUp,
                    showConfirmPassword: true,
                    resetPassword: null,
                  ),
                ],
                SizedBox(height: 20),
                if (_isSignIn) ...[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isSignIn = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
                if (!_isSignIn) ...[
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: _resetPassword,
                    child: Text('Forgot Password?'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isSignIn = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Sign In'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm({
    required String title,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    TextEditingController? confirmPasswordController,
    required VoidCallback onSubmit,
    required bool showConfirmPassword,
    VoidCallback? resetPassword,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _buildTextField(emailController, 'Email', Icons.email),
        SizedBox(height: 16),
        _buildTextField(passwordController, 'Password', Icons.lock,
            obscureText: true),
        if (showConfirmPassword) ...[
          SizedBox(height: 16),
          _buildTextField(
              confirmPasswordController!, 'Confirm Password', Icons.lock,
              obscureText: true),
        ],
        SizedBox(height: 20),
        if (resetPassword != null) ...[
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: resetPassword,
              child: Text('Forgot Password?'),
            ),
          ),
        ],
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: onSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
          ),
          child: Text(title),
        ),
      ],
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool obscureText = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
