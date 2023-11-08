import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controllers/question_controller.dart';
import 'package:quiz_app/Screens/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
