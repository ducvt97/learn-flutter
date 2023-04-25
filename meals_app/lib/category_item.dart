import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({required this.title, required this.color, super.key});

  void selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CategoryMealsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
