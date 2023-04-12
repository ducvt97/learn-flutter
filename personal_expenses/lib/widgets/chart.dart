import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class Chart extends StatelessWidget {
  final Transaction transaction;
  const Chart({required this.transaction, super.key});
  List<Map> get groupedAmount {
    final now = DateTime.now();
    return List.generate(
      7,
      (index) => {
        'day': DateFormat('dd/MM').format(
          now.subtract(
            Duration(days: index),
          ),
        ),
        'amount': lastWeekAmount[index],
      },
    );
  }

  List<double> get lastWeekAmount {
    final result = List.filled(7, 0.0);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
