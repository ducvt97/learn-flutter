import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/models/category.dart';

const categories = [
  Category(id: '1', title: 'Italian', color: Colors.amber),
  Category(id: '2', title: 'Vietnamese', color: Colors.teal),
  Category(id: '3', title: 'Asia', color: Colors.lime),
  Category(id: '4', title: 'Fast Food', color: Colors.orange),
  Category(id: '5', title: 'Asia', color: Colors.amber),
  Category(id: '6', title: 'Thailand', color: Colors.teal),
  Category(id: '7', title: 'Vegan', color: Colors.lime),
  Category(id: '8', title: 'Desert', color: Colors.orange),
  Category(id: '9', title: 'Soup', color: Colors.lightBlue),
];

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeal')),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        children: categories
            .map((item) => CategoryItem(title: item.title, color: item.color))
            .toList(),
      ),
    );
  }
}
