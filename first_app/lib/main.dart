import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = const [
    {
      'question': 'What\'s your name?',
      'answers': [
        {'text': 'Duc', 'score': 1},
        {'text': 'Tu', 'score': 2},
        {'text': 'Tam', 'score': 3},
      ],
    },
    {
      'question': 'How old are you?',
      'answers': [
        {'text': '20', 'score': 1},
        {'text': '26', 'score': 2},
        {'text': '30', 'score': 3},
      ],
    }
  ];
  int currentQIndex = 0;
  int totalScore = 0;

  void pressAnswer(int score) {
    setState(() {
      currentQIndex = currentQIndex + 1;
      totalScore += score;
    });
  }

  void pressRedoQuiz() {
    setState(() {
      currentQIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: currentQIndex < questions.length
            ? Quiz(
                questions: questions,
                currentQIndex: currentQIndex,
                pressAnswer: pressAnswer,
              )
            : Result(
                score: totalScore,
                redoQuiz: pressRedoQuiz,
              ),
      ),
    ));
  }
}
