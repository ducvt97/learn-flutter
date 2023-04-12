import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  NewTransaction({required this.addNewTransaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
            ),
            TextButton(
              onPressed: () => addNewTransaction(
                  titleController.text, amountController.text),
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
