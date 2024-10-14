import 'package:flutter/material.dart';

class QRTViewCamp extends StatelessWidget {
  // Mock list of camp details
  final List<String> camps = [
    "Camp A - Location: Zone 1, Capacity: 100",
    "Camp B - Location: Zone 2, Capacity: 150",
    "Camp C - Location: Zone 3, Capacity: 200",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Camp Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: camps.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(camps[index]),
                trailing: ElevatedButton(
                  onPressed: () {
                    // You can navigate to a detailed view of the camp if needed
                    print("View details of camp: ${camps[index]}");
                  },
                  child: Text("View Details"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
