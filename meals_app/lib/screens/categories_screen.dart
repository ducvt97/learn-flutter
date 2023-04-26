import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
import '../models/category.dart';

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
        children: DUMMY_CATEGORIES
            .map((item) =>
                CategoryItem(id: item.id, title: item.title, color: item.color))
            .toList(),
      ),
    );
  }
}
