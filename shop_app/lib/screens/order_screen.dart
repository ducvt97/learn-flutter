import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<bool> ordersExpanded = [];

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<Order>(context);
    final orders = orderProvider.orders;

    for (int i = 0; i < orders.length; i++) {
      ordersExpanded.add(false);
    }
    List<ExpansionPanel> builder() {
      List<ExpansionPanel> list = [];
      for (int i = 0; i < orders.length; i++) {
        final order = orders[i];
        list.add(
          ExpansionPanel(
            isExpanded: ordersExpanded[i],
            headerBuilder: (context, isExpanded) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${order.amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(DateFormat('dd/MM/yyy hh:mm').format(order.date)),
                ],
              ),
            ),
            body: SizedBox(
              height: (32 * order.products.length).toDouble(),
              child: ListView(children: [
                ...order.products.map(
                  (product) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const Spacer(),
                        Text(
                          '${product.quantity} x \$${product.price}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      }
      return list;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionPanelList(
              children: builder(),
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  ordersExpanded[panelIndex] = !ordersExpanded[panelIndex];
                });
              },
            )
          ],
        ),
      ),
      drawer: const Drawer(child: MainDrawer()),
    );
  }
}
