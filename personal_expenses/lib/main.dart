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
  bool _showChart = false;

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
    final bool isLandscapeMode =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text('Personal Expenses App'),
      actions: [
        IconButton(
          onPressed: () {
            _showAddNewTransactionModal(context);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );

    Widget chartWidget(double percent) {
      return SizedBox(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                appBar.preferredSize.height) *
            percent,
        width: double.infinity,
        child: Chart(transactions: _transactions),
      );
    }

    final txList = SizedBox(
      height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              appBar.preferredSize.height) *
          0.7,
      child: TransactionList(
        transactions: _transactions,
        deleteTransaction: _deleteTransaction,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isLandscapeMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Show Chart'),
                  Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscapeMode) chartWidget(0.3),
            if (!isLandscapeMode) txList,
            if (isLandscapeMode) _showChart ? chartWidget(0.7) : txList,
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
