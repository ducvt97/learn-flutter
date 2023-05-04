import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final thisContext = context;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        '/product-detail',
        arguments: product.id,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: GridTile(
          footer: GridTileBar(
            title: Text(product.title),
            leading: IconButton(
              onPressed: product.toggleFavorite,
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_outline,
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            trailing: Consumer<Cart>(
              builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.addItem(product.id, product.title, product.price);
                  ScaffoldMessenger.of(thisContext).hideCurrentSnackBar();
                  ScaffoldMessenger.of(thisContext).showSnackBar(
                    const SnackBar(
                      content: Text('Item added!'),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                color: Theme.of(thisContext).colorScheme.secondary,
              ),
            ),
            backgroundColor: Colors.black87,
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
