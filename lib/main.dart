import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Screens/HomePage.dart';
import 'package:quiz_app/Screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/home',
      getPages: [
        GetPage(name: "/home", page: () => const HomePage()),
        GetPage(name: "/quiz", page: () => const QuizScreen()),

      ],
    );
  }
}

