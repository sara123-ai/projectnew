import 'package:flutter/material.dart';

class UserRequestRescue extends StatefulWidget {
  @override
  _UserRequestRescueState createState() => _UserRequestRescueState();
}

class _UserRequestRescueState extends State<UserRequestRescue> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _contactController = TextEditingController();

  void _requestRescue() {
    if (_formKey.currentState!.validate()) {
      String location = _locationController.text;
      String contact = _contactController.text;

      // Logic for requesting rescue (e.g., save to a database or send request)
      print("Rescue Requested: Location: $location, Contact: $contact");

      // Navigate back to the home screen or show a success message
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Rescue"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _requestRescue,
                child: Text("Request Rescue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
