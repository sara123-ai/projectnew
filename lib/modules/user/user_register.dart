import 'package:flutter/material.dart';
import 'user_home.dart'; // Import the User Home page

class UserRegisterPage extends StatefulWidget {
  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _situationController = TextEditingController();

  // Simulate map viewing (you can replace with actual map integration)
  void _viewMap() {
    // You can integrate with Google Maps or other map services here
    print('Map is viewed');
  }

  // Handle User registration logic
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String phoneNumber = _phoneController.text;
      String situation = _situationController.text;

      // Add your registration logic here (save data to database or send it to the server)
      print('User Registered: $name, $phoneNumber, Situation: $situation');

      // After successful registration, navigate to the user home page and pass user name
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserHomePage(userName: name), // Pass the user's name to the home page
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Stack(
        fit: StackFit.expand, // Make the background image cover the entire screen
        children: [
          // Background image
          Image.asset(
            'assets/user.png', // Path to the image
            fit: BoxFit.fill, // Cover the entire screen
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 350, // Set a fixed width for the form
                padding: const EdgeInsets.all(16.0), // Padding inside the container
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3), // Transparent background with 30% opacity
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                 // border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 2), // White border around the container
                ),
                child: Form(
                  key: _formKey,

                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Let the form take up only the necessary vertical space
                    children: [
                      // Name input field
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5), // Slightly more solid input background
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 18),

                      // Phone number input field
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5), // Slightly more solid input background
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Situation description input field
                      TextFormField(
                        controller: _situationController,
                        decoration: InputDecoration(
                          labelText: 'Current Situation',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5), // Slightly more solid input background
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please describe your current situation';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // View Map button
                      ElevatedButton(
                        onPressed: _viewMap,
                        child: Text('View Map'),
                      ),
                      SizedBox(height: 20),

                      // Submit button
                      ElevatedButton(
                        onPressed: _handleSubmit,
                        child: Text('Submit'),
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
