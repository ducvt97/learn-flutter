import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  List<Map> get _groupedAmount {
    final now = DateTime.now();
    return List.generate(
      7,
      (index) => {
        'day': DateFormat('dd/MM').format(
          now.subtract(
            Duration(days: index),
          ),
        ),
        'amount': _lastWeekAmount[index],
      },
    );
  }

  List<double> get _lastWeekAmount {
    final result = List.filled(7, 0.0);
    final now = DateTime.now();

    for (var tx in transactions) {
      final difference = now.difference(tx.date).inDays;
      if (difference <= 6) {
        result[difference] = result[difference] + tx.amount;
      }
    }
    return result;
  }

  double get _totalAmount {
    return _groupedAmount.fold(0.0, (sum, item) => sum += item['amount']);
  }

  const Chart({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ..._groupedAmount.map(
              (item) => Expanded(
                child: ChartBar(
                  label: item['day'],
                  amount: item['amount'],
                  percentage:
                      _totalAmount == 0 ? 0 : item['amount'] / _totalAmount,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
