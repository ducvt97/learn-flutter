import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    final mealImg = SizedBox(
      height: 300,
      child: Image.network(
        selectedMeal.imgUrl,
        fit: BoxFit.cover,
      ),
    );

    final ingredientList = ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Text(selectedMeal.ingredients[index]),
        );
      },
      itemCount: selectedMeal.ingredients.length,
    );

    final stepList = ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Text(selectedMeal.steps[index]),
        );
      },
      itemCount: selectedMeal.steps.length,
    );

    Widget buildContainer(String title, Widget content) {
      return Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Container(
            width: 300,
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 1.5),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: content,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            mealImg,
            const SizedBox(height: 16),
            buildContainer('Ingredients', ingredientList),
            const SizedBox(height: 16),
            buildContainer('Steps', stepList),
          ],
        ),
      ),
    );
  }
}
