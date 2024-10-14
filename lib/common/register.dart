import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Form Key to validate the form
  final _formKey = GlobalKey<FormState>();

  // Controllers for the text fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Variable to hold the selected user type
  String? _selectedUserType;

  // List of available user types
  final List<String> _userTypes = [
    'Admin',
    'Flood Management Team',
    'Quick Response Team',
    'Camp',
    'User'
  ];

  // Function to handle registration
  void _register() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic here
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String userType = _selectedUserType!;

      // For now, we just print the information
      print('Name: $name');
      print('Email: $email');
      print('Password: $password');
      print('User Type: $userType');

      // Redirect to the appropriate home screen based on user type
      switch (userType) {
        case 'Admin':
          Navigator.pushNamed(context, '/admin');
          break;
        case 'Flood Management Team':
          Navigator.pushNamed(context, '/fmt');
          break;
        case 'Quick Response Team':
          Navigator.pushNamed(context, '/qrt');
          break;
        case 'Camp':
          Navigator.pushNamed(context, '/camp');
          break;
        case 'User':
          Navigator.pushNamed(context, '/user');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Form validation key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Name Input Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              // Email Input Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              // Password Input Field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password should be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Dropdown for User Type
              DropdownButtonFormField<String>(
                value: _selectedUserType,
                hint: Text("Select User Type"),
                onChanged: (newValue) {
                  setState(() {
                    _selectedUserType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a user type';
                  }
                  return null;
                },
                items: _userTypes.map((userType) {
                  return DropdownMenuItem<String>(
                    value: userType,
                    child: Text(userType),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              // Register Button
              Center(
                child: ElevatedButton(
                  onPressed: _register,
                  child: Text("Register"),
                ),
              ),
              // Link to Login Page
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to Login page
                    Navigator.pop(context);
                  },
                  child: Text("Already have an account? Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
