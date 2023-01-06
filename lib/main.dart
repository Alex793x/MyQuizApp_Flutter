import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'quiz_page.dart';

QuizQuestions quizBrain = QuizQuestions();

void main() => runApp(const MyApp());

int correctAnswers = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quizzer By Alex',
        home: Scaffold(
          backgroundColor: Colors.black12,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      );
}
