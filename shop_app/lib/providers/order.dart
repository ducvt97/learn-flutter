import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime date;

  const OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.date,
  });
}

class Order with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> products, double amount) {
    final date = DateTime.now();
    _orders.insert(
      0,
      OrderItem(
        id: date.toString(),
        amount: amount,
        products: products,
        date: date,
      ),
    );
  }
}
