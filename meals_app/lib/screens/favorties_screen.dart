import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    return favorites.isEmpty
        ? const Center(
            child: Text('You have no favorite meal.'),
          )
        : ListView.builder(
            itemBuilder: (context, index) => MealItem(
              id: favorites[index].id,
              title: favorites[index].title,
              affordability: favorites[index].affordability,
              imgUrl: favorites[index].imgUrl,
              duration: favorites[index].duration,
              complexity: favorites[index].complexity,
            ),
            itemCount: favorites.length,
          );
  }
}
