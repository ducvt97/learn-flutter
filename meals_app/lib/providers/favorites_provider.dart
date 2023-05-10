import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleFavoriteMeal(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((item) => item.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }

  bool isFavorite(Meal meal) {
    return state.contains(meal);
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) => FavoriteMealsNotifier(),
);
