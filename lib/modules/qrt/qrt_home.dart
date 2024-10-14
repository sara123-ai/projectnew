import 'package:flutter/material.dart';

class QRTHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Response Team Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qrt_view_requests');
              },
              child: Text("View Rescue Requests"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qrt_register_rescue');
              },
              child: Text("Register Rescued Person"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qrt_view_camp');
              },
              child: Text("View Camp Details"),
            ),
          ],
        ),
      ),
    );
  }
}
