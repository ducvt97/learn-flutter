import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentage;
  const ChartBar(
      {required this.label,
      required this.amount,
      required this.percentage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 20,
            child: FittedBox(
              child: Text('\$$amount'),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 100,
            width: 20,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                FractionallySizedBox(
                  // box take percentage width/height of parent
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(label),
        ],
      ),
    );
  }
}
