import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'main.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                  flex: 4,
                  child: Icon(
                    Icons.check_circle_outline_sharp,
                    size: 100,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Well Done, you answered correct a total of $correctAnswers times!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print('Try again button was pressed');
                          }
                          correctAnswers = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (startOver) => const MyApp(),
                            ),
                          );
                        },
                        child: const Text(
                          'Try again',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
