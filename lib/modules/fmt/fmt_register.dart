import 'package:flutter/material.dart';

class FMTRegisterPage extends StatefulWidget {
  @override
  _FMTRegisterPageState createState() => _FMTRegisterPageState();
}

class _FMTRegisterPageState extends State<FMTRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _teamController = TextEditingController();

  // Handle FMT registration logic
  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String teamName = _teamController.text;

      // Add your registration logic here
      print("FMT Registered: $name, $email, Team: $teamName");

      // After registration, navigate to FMT Home or login page
      Navigator.pushReplacementNamed(context, '/fmt_home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FMT Registration'),
      ),
      body: Stack(
        fit: StackFit.expand, // Ensure the background image covers the whole screen
        children: [
          // Background image
          Image.asset(
            'assets/fmtimg.png', // Replace with your actual background image path
            fit: BoxFit.fill, // Cover the entire screen
          ),
          Center( // Center the form on the screen
            child: SingleChildScrollView(
              child: Container(
                height: 500,
                width: 350, // Set the fixed width of the form container
                padding: const EdgeInsets.all(20.0), // Add padding inside the container
                decoration: BoxDecoration(
                //color: Colors.white.withOpacity(0.5), // Semi-transparent background color
                  //borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
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
                          fillColor: Colors.white.withOpacity(0.5),
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
