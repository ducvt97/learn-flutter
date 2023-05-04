import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/main_drawer.dart';
import 'package:shop_app/widgets/product_item.dart';

enum ShowType {
  showAll,
  showFavorite,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showFavorite = false;

  void selectShowType(ShowType type) {
    setState(() {
      if (type == ShowType.showAll) {
        showFavorite = false;
      } else {
        showFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: ShowType.showAll,
                child: Text('Show All'),
              ),
              const PopupMenuItem(
                value: ShowType.showFavorite,
                child: Text('Show Favorite'),
              ),
            ],
            onSelected: selectShowType,
          ),
          Consumer<Cart>(
            builder: (context, value, _) => IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
              icon: Badge(
                label: Text('${value.items.length}'),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: ProductsGrid(showFavorite: showFavorite),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  final bool showFavorite;
  const ProductsGrid({super.key, required this.showFavorite});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final products = showFavorite
        ? productsProvider.favoriteProducts
        : productsProvider.products;

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: const ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}
