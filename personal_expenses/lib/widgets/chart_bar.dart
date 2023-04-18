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
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('\$$amount'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.6,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
