import 'package:flutter/material.dart';
// import 'package:flutter_application_1/config/config.dart';
// import 'package:flutter_application_1/sender_page/home.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_application_1/sender_page/login.dart';
import 'package:flutter_application_1/sender_page/register_user.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: RegisterPage(),
    );
  }
}
