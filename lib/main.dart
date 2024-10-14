import 'package:flood_management_app/auth/common_login_page.dart';
import 'package:flood_management_app/modules/admin/admin_home.dart';
import 'package:flood_management_app/modules/admin/admin_register.dart';
import 'package:flood_management_app/modules/fmt/fmt_home.dart';
import 'package:flood_management_app/modules/fmt/fmt_register.dart';
import 'package:flood_management_app/modules/qrt/qrt_home.dart';
import 'package:flood_management_app/modules/qrt/qrt_register.dart';
import 'package:flood_management_app/modules/user/user_home.dart';
import 'package:flood_management_app/modules/user/user_register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flood Management System',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => CommonLoginPage(),
        '/admin_home': (context) => AdminHome(),
        '/admin_register': (context) => AdminRegisterPage(),
        '/fmt_home': (context) => FMTHome(),
        '/fmt_register': (context) => FMTRegisterPage(),
        '/qrt_home': (context) => QRTHome(),
        '/qrt_register': (context) => QRTRegisterPage(),
        '/user_home': (context) => UserHomePage(userName: '',),
        '/user_register': (context) => UserRegisterPage(),
      },
    );
  }
}
