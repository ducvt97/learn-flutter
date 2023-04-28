import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var diceNumber = 1;

  void rollDice() {
    final randomInt = Random().nextInt(6);
    setState(() {
      diceNumber = randomInt + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/dice-$diceNumber.png', width: 200),
          TextButton(
            onPressed: rollDice,
            style: const ButtonStyle(
              textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 24)),
            ),
            child: const Text('Roll Dice'),
          ),
        ],
      ),
    );
  }
}
