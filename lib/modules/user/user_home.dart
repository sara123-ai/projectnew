import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  final String userName;

  // Constructor to pass user details
  UserHomePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting the user
            Text(
              'Welcome, $userName!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            
            // Display message or instructions
            Text(
              'You can now request rescue assistance, update your profile, or view important information.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Button to request rescue
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user_request_rescue');
              },
              child: Text('Request Rescue'),
            ),
            SizedBox(height: 16),

            // Button to update user profile
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user_update_profile');
              },
              child: Text('Update Profile'),
            ),
            SizedBox(height: 16),

            // Additional functionality or instructions can be added here
            ElevatedButton(
              onPressed: () {
                print('Additional functionality goes here.');
              },
              child: Text('View More Information'),
            ),
          ],
        ),
      ),
    );
  }
}
