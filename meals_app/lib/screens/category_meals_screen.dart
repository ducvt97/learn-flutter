import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends ConsumerWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    final args =
        (ModalRoute.of(context)!.settings.arguments as Map<String, String>);
    final mealTitle = args['title'], mealId = args['id'];
    final meals = DUMMY_MEALS
        .where(
          (element) =>
              element.categories.contains(mealId) &&
              element.isGlutenFree == filters[Filter.isGlutenFree] &&
              element.isLactoseFree == filters[Filter.isLactoseFree] &&
              element.isVegan == filters[Filter.isVegan] &&
              element.isVegetarian == filters[Filter.isVegetarian],
        )
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(mealTitle ?? 'Meal')),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          id: meals[index].id,
          title: meals[index].title,
          affordability: meals[index].affordability,
          imgUrl: meals[index].imgUrl,
          duration: meals[index].duration,
          complexity: meals[index].complexity,
        ),
        itemCount: meals.length,
      ),
    );
  }
}
