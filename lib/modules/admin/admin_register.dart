import 'package:flutter/material.dart';

class AdminRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Registration')),
      body: Stack(
        fit: StackFit.expand, // Ensures the background image covers the screen
        children: [
          // Background image
          Image.asset(
            'assets/background.jpg', // Replace with the path of your background image
            fit: BoxFit.cover, // Ensures the image fills the background
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centers the form content vertically
              children: [
                // Admin Name input field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Admin Name',
                    filled: true, // Fill the text field background
                    fillColor: Colors.white.withOpacity(0.9), // Make background semi-transparent
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Admin Email input field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Admin Email',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Password input field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),

                // Register button
                ElevatedButton(
                  onPressed: () {
                    // Implement registration logic
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
