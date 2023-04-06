import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question({this.questionText = '', super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity, // max size of screen
      padding: const EdgeInsets.all(12),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
