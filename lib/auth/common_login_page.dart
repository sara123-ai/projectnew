import 'package:flutter/material.dart';

class CommonLoginPage extends StatefulWidget {
  @override
  _CommonLoginPageState createState() => _CommonLoginPageState();
}

class _CommonLoginPageState extends State<CommonLoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? _selectedRole;

  // Handle Login Logic
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      if (_selectedRole == 'Admin') {
        Navigator.pushNamed(context, '/admin_home');
      } else if (_selectedRole == 'FMT') {
        Navigator.pushNamed(context, '/fmt_home');
      } else if (_selectedRole == 'QRT') {
        Navigator.pushNamed(context, '/qrt_home');
      } else if (_selectedRole == 'User') {
        Navigator.pushNamed(context, '/user_home');
      } else {
        print('Please select a role');
      }
    }
  }

  // Handle Registration logic
  void _handleRegister() {
    if (_selectedRole == 'Admin') {
      Navigator.pushNamed(context, '/admin_register');
    } else if (_selectedRole == 'FMT') {
      Navigator.pushNamed(context, '/fmt_register');
    } else if (_selectedRole == 'QRT') {
      Navigator.pushNamed(context, '/qrt_register');
    } else if (_selectedRole == 'User') {
      Navigator.pushNamed(context, '/user_register');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a role to create a new account')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bgimg.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Centering the form, move it slightly down by using padding
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0), // Move the form down
                child: Container(
                  width: screenWidth * 0.75, // Form width (relative to screen size)
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the form fields
                        children: [
                          // Name input field
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.black87),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),

                          // Password input field
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.black87),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),

                          // Role selection dropdown
                          DropdownButtonFormField<String>(
                            value: _selectedRole,
                            hint: Text('Select Role'),
                            items: ['Admin', 'FMT', 'QRT', 'User']
                                .map((role) => DropdownMenuItem(
                                      value: role,
                                      child: Text(role),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedRole = value;
                              });
                            },
                            validator: (value) => value == null ? 'Please select a role' : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Stylish Login button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ), // Background color
                            ),
                            onPressed: _handleLogin,
                            child: Text('Login', style: TextStyle(fontSize: 18)),
                          ),

                          SizedBox(height: 10),

                          // Create a New Account button
                          TextButton(
                            onPressed: () {
                              // Redirect to registration page based on selected role
                              _handleRegister();
                            },
                            child: Text(
                              'Create a New Account',
                              style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
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
