import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback redoQuiz;
  const Result({required this.score, required this.redoQuiz, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Quiz finish!!\n Your total score: $score',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            onPressed: redoQuiz,
            child: const Text('Redo Quiz'),
          ),
        ],
      ),
    );
  }
}
