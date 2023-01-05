import 'dart:collection';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  LinkedHashMap<String, bool> questions = LinkedHashMap.from({
    'The capital of Egypt is Cairo.': true,
    'The Greek god Zeus is the god of the sea.': false,
    'The Roman emperor Julius Caesar was assassinated on the Ides of March.':
        true,
    'The sport of soccer is also known as football.': true,
    'The color of the sky is caused by the reflection of the oceans.': false,
    'The Asgardian god Thor is the god of wisdom.': false,
    'You can lead a cow downstairs, but not upstairs.': false,
    'Approximately one quarter of human bones are in the feet.': true,
    'A slug\'s blood is green.': true,
    'The Earth has eight planets in its solar system.': false,
    'The Asgardian god Vidar is the god of silence.': false,
    'The sport of swimming is one of the oldest Olympic sports.': true,
    'The sport of tennis originated in France.': true
  });

  int counter = 0;
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
          child: quizText(questions.keys.elementAt(counter)),
        ),
        Expanded(
          flex: 1,
          child: Card(
            margin: const EdgeInsets.all(15),
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                if (questions.values.elementAt(counter) == true) {
                  setState(() {
                    scoreKeeper.add(greenCheck());
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(redCheck());
                  });
                }
                if (counter == questions.length - 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CongratulationScreen()));
                } else {
                  counter++;
                }
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
                if (questions.values.elementAt(counter) == false) {
                  setState(() {
                    scoreKeeper.add(greenCheck());
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(redCheck());
                  });
                }
                if (counter == questions.length - 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CongratulationScreen()));
                } else {
                  counter++;
                }
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

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Congratulations',
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Center(
            child: Column(
              children: const [
                Expanded(
                  child: Icon(
                    Icons.wine_bar_sharp,
                    size: 100,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Well Done!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
