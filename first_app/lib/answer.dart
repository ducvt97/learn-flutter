import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String? answerText;
  final VoidCallback? onPressed; // a type of function
  const Answer({super.key, this.answerText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      child: answerText != null
          ? ElevatedButton(
              onPressed: onPressed,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              ),
              child: Text(answerText!),
            )
          : const Text('Error loading answer!'),
    );
  }
}
