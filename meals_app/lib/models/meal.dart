enum Complexity {
  simple,
  challenging,
  difficult,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final String imgUrl;
  final List<String> ingredients;
  final List<String> steps;
  final double duration;
  final Complexity complexity;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.imgUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
