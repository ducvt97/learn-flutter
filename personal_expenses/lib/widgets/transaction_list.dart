import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((item) => TransactionItem(transaction: item)),
      ],
    );
  }
}
