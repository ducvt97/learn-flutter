import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses App',
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(fontSize: 16),
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.deepPurple),
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(title: 'as', amount: 14, date: DateTime(2023, 4, 9)),
    Transaction(title: 'as', amount: 10, date: DateTime(2023, 4, 10)),
    Transaction(title: 'as', amount: 20, date: DateTime(2023, 4, 11)),
    Transaction(title: 'as', amount: 5, date: DateTime(2023, 4, 12)),
  ];

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _showAddNewTransactionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => NewTransaction(addNewTransaction: _addNewTransaction),
    );
  }

  void _deleteTransaction(int index) {
    setState(() {
      _transactions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses App'),
        actions: [
          IconButton(
            onPressed: () {
              _showAddNewTransactionModal(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Chart(transactions: _transactions),
            ),
            _transactions.isNotEmpty
                ? Column(
                    children: [
                      TransactionList(
                        transactions: _transactions,
                        deleteTransaction: _deleteTransaction,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text('No transaction added yet!!',
                          style: Theme.of(context).textTheme.titleMedium),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        height: 200,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddNewTransactionModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
