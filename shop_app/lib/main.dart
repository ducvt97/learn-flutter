import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/order.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Order(),
        ),
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            labelLarge: TextStyle(fontSize: 20),
            labelMedium: TextStyle(fontSize: 18),
            labelSmall: TextStyle(fontSize: 16, color: Colors.black54),
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 15),
            bodySmall: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          fontFamily: 'Lato',
          badgeTheme: const BadgeThemeData(textStyle: TextStyle(fontSize: 12)),
        ),
        routes: {
          '/': (context) => const ProductOverviewScreen(),
          '/product-detail': (context) => const ProductDetailScreen(),
          '/cart': (context) => const CartScreen(),
          '/orders': (context) => const OrderScreen(),
          '/user-products': (context) => const UserProductsScreen(),
          '/add-edit-product': (context) => const EditProductScreen(),
        },
      ),
    );
  }
}
