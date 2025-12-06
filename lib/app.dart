import 'package:flutter/material.dart';
import 'package:ostad_exam/ui/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Ostad Exam', home: HomeScreen());
  }
}
