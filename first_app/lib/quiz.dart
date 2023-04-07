import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function pressAnswer;
  final int currentQIndex;

  const Quiz({
    required this.questions,
    required this.currentQIndex,
    required this.pressAnswer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[currentQIndex]['question'] as String,
        ),
        ...(questions[currentQIndex]['answers'] as List)
            .map(
              (answer) => Answer(
                answerText: answer['text'].toString(),
                onPressed: () => pressAnswer(answer['score']),
              ),
            )
            .toList(),
      ],
    );
  }
}
