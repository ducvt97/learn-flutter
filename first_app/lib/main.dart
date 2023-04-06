import 'package:first_app/question.dart';

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
  var questions = ['What\'s your name?', 'How old are you?'], currentQIndex = 0;

  void onPressBtn() {
    setState(() {
      currentQIndex = currentQIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: Column(children: [
        Question(questionText: questions[currentQIndex]),
        ElevatedButton(
          onPressed: onPressBtn,
          child: const Text('Change Question'),
        ),
      ]),
    ));
  }
}
