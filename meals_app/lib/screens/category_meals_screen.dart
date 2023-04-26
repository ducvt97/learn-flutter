import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        (ModalRoute.of(context)!.settings.arguments as Map<String, String>);
    final mealTitle = args['title'], mealId = args['id'];
    final meals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(mealId),
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
