import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  const TransactionList(
      {required this.transactions, required this.deleteTransaction, super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) => Column(children: [
              Text('No transaction added yet!!',
                  style: Theme.of(context).textTheme.titleMedium),
              Container(
                margin: const EdgeInsets.only(top: 16),
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]),
          )
        : ListView.builder(
            itemBuilder: (context, index) => TransactionItem(
              transaction: transactions[index],
              deleteTransaction: () => deleteTransaction(index),
            ),
            itemCount: transactions.length,
          );
  }
}
