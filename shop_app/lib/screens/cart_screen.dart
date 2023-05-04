import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/order.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Consumer<Cart>(
        builder: (context, cartProvider, _) => Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Text('Total'),
                    const SizedBox(width: 12),
                    Chip(label: Text('\$ ${cartProvider.totalAmount}')),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Provider.of<Order>(context, listen: false).addOrder(
                          cartProvider.items.values.toList(),
                          cartProvider.totalAmount,
                        );
                        cartProvider.clearCart();
                      },
                      child: const Text('ORDER NOW'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final cartItems = cartProvider.items.values.toList();
                  return CartListItem(
                    id: cartItems[index].id,
                    title: cartItems[index].title,
                    price: cartItems[index].price,
                    quantity: cartItems[index].quantity,
                  );
                },
                itemCount: cartProvider.itemsCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
