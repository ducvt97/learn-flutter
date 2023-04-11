import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(id: '1', title: 'Food', amount: 10, date: DateTime.now()),
    Transaction(id: '2', title: 'Drink', amount: 5, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, String amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: double.parse(amount),
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          addNewTransaction: _addNewTransaction,
        ),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
