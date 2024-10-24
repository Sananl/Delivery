import 'package:flutter/material.dart';
import 'package:flutter_application_1/sender_page/login.dart';
import 'package:flutter_application_1/sender_page/order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, // สีพื้นหลังของ Scaffold
      ),
      home: LoginPage(), 
    );
  }
}
