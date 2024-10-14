import 'package:flutter/material.dart';

class CampHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camp Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/camp_request_commodities');
              },
              child: Text("Request Commodities"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/camp_register_member');
              },
              child: Text("Register Camp Member"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/camp_update_profile');
              },
              child: Text("Update Camp Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
