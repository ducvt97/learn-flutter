import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Personal Expenses App',
      home: MyHomePage(),
    );
  }
}

final List<Transaction> transactions = [
  Transaction(id: '1', title: 'Food', amount: 10, date: DateTime.now()),
  Transaction(id: '2', title: 'Drink', amount: 5, date: DateTime.now()),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Expenses App')),
      body: Column(children: [
        Container(
          width: double.infinity,
          child: const Card(
            child: Text('CHART'),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            ...transactions.map(
              (item) => Card(
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.deepPurple,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '\$${item.amount.toString()}',
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 16,
                          ),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 8,
                            right: 16,
                          ),
                          child: Text(
                            DateFormat('dd-MM-yyyy').format(item.date),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
