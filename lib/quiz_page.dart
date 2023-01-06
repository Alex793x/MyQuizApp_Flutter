import 'package:flutter/material.dart';

import 'main.dart';
import 'quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  Icon greenCheck() => const Icon(
        Icons.check,
        color: Colors.green,
      );
  Icon redCheck() => const Icon(
        Icons.close,
        color: Colors.red,
      );
  Center quizText(String text) => Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: quizText(QuizQuestions().getQuestionText()),
        ),
        Expanded(
          flex: 1,
          child: Card(
            margin: const EdgeInsets.all(15),
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                if (QuizQuestions().getQuestionAnswer() == true) {
                  correctAnswers++;
                  setState(() {
                    scoreKeeper.add(greenCheck());
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(redCheck());
                  });
                }
                QuizQuestions().nextQuestion();
              },
              child: const Text(
                'True',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            margin: const EdgeInsets.all(15),
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                if (QuizQuestions().getQuestionAnswer() == false) {
                  correctAnswers++;
                  setState(() {
                    scoreKeeper.add(greenCheck());
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(redCheck());
                  });
                }
                QuizQuestions().nextQuestion();
              },
              child: const Text(
                'False',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
