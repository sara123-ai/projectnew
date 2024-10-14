import 'package:flutter/material.dart';

class CommonLoginPage extends StatefulWidget {
  @override
  _CommonLoginPageState createState() => _CommonLoginPageState();
}

class _CommonLoginPageState extends State<CommonLoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  
  String _selectedRole = 'User'; // Default selected role
  List<String> _roles = ['Admin', 'FMT', 'QRT', 'User']; // Roles list

  // Function to handle login
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      
      // Example credentials (use actual authentication in a real app)
      if (email == "admin@example.com" && password == "adminpass" && _selectedRole == "Admin") {
        Navigator.pushReplacementNamed(context, '/admin_home');
      } else if (email == "fmt@example.com" && password == "fmtpass" && _selectedRole == "FMT") {
        Navigator.pushReplacementNamed(context, '/fmt_home');
      } else if (email == "qrt@example.com" && password == "qrtpass" && _selectedRole == "QRT") {
        Navigator.pushReplacementNamed(context, '/qrt_home');
      } else if (email == "user@example.com" && password == "userpass" && _selectedRole == "User") {
        Navigator.pushReplacementNamed(context, '/user_home');
      } else {
        // Invalid credentials
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid credentials or role'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email input
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Password input
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
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
                decoration: InputDecoration(labelText: 'Role'),
                items: _roles.map((String role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a role';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Login button
              Center(
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
