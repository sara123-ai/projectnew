import 'package:flutter/material.dart';

class FMTHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flood Management Team Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fmt_register_camp');
              },
              child: Text("Register Camp"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fmt_register_qrt');
              },
              child: Text("Register QRT"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fmt_assign_request');
              },
              child: Text("Assign Request to QRT"),
            ),
          ],
        ),
      ),
    );
  }
}
