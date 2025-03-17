import 'package:flutter/material.dart';
import 'package:prog_mobile_app_educadin/pages/login/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EducaDin',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
     home: const WelcomePage(),
    );
  }
}

