import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            '\$${transaction.amount.toString()}',
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
                  transaction.title,
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
                  DateFormat('dd-MM-yyyy').format(transaction.date),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}