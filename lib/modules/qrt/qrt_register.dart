import 'package:flutter/material.dart';

class QRTRegisterPage extends StatefulWidget {
  @override
  _QRTRegisterPageState createState() => _QRTRegisterPageState();
}

class _QRTRegisterPageState extends State<QRTRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _teamController = TextEditingController();

  // Handle QRT registration logic
  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String teamName = _teamController.text;

      // Add registration logic here (e.g., save to a database or API call)
      print("QRT Registered: $name, $email, Team: $teamName");

      // After registration, navigate to QRT home page or login page
      Navigator.pushReplacementNamed(context, '/qrt_home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRT Registration'),
      ),
      body: Stack(
        fit: StackFit.expand, // Ensure the background image covers the entire screen
        children: [
          // Background image
          Image.asset(
            'assets/rescu.png', // Replace with your actual image file path
            fit: BoxFit.fill, // Ensure the image covers the entire background
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView( // Prevents overflow when keyboard appears
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Name input field
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5), // Semi-transparent background
                         // border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Email input field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                         // border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Team Name input field
                      TextFormField(
                        controller: _teamController,
                        decoration: InputDecoration(
                          labelText: 'Team Name',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                        //  border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your team name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Password input field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                         // border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Register button
                      ElevatedButton(
                        onPressed: _handleRegister,
                        child: Text('Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
