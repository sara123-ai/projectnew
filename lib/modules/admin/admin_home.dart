// modules/admin/admin_home.dart
import 'package:flutter/material.dart';
import 'admin_manage_camp.dart';
import 'admin_manage_qrt.dart';
import 'admin_manage_members.dart';
import 'admin_notifications.dart';
import 'admin_view_details.dart';


class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Home")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: Text('Manage Camps'),
            onTap: () {
              // Navigate to manage camps
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminManageCamp()));
            },
          ),
          ListTile(
            title: Text('Manage Quick Response Team'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminManageQRT()));
            },
          ),
          ListTile(
            title: Text('Manage Members'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminManageMembers()));
            },
          ),
          ListTile(
            title: Text('Display Notifications'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNotifications()));
            },
          ),
          ListTile(
            title: Text('View Details'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminViewDetails()));
            },
          ),
        ],
      ),
    );
  }
}

// Separate files will be created for other functions like AdminManageCamp, AdminManageQRT, etc.
