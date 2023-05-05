import 'package:flutter/material.dart';
import 'package:shop_app/dummy_data.dart';
import 'package:shop_app/providers/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = [...PRODUCT_LIST];

  List<Product> get products {
    return [..._products];
  }

  List<Product> get favoriteProducts {
    return _products.where((product) => product.isFavorite == true).toList();
  }

  Product getById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  void addProduct(Product product) {
    _products.insert(
      0,
      Product(
        id: product.id,
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      ),
    );
    notifyListeners();
  }

  void updateProduct(String id, Product updatedProduct) {
    final index = _products.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
