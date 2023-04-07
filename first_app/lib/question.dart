import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String? questionText;

  const Question({@required this.questionText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity, // max size of screen
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        questionText ?? 'Error loading question!',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
