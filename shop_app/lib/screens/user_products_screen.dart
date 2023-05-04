import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/main_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    final products = productProvider.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: products[index],
                  builder: (context, child) => UserProductItem(
                    id: products[index].id,
                    title: products[index].title,
                    imageUrl: products[index].imageUrl,
                  ),
                ),
                itemCount: products.length,
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(child: MainDrawer()),
    );
  }
}
