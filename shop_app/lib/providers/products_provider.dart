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
}
