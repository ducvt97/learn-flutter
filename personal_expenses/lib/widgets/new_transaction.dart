import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({required this.addNewTransaction, super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void _submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isNotEmpty && amount >= 0) {
      widget.addNewTransaction(title, amount);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              controller: amountController,
            ),
            TextButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
