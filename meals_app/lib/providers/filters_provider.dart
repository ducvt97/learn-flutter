import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  isGlutenFree,
  isVegan,
  isVegetarian,
  isLactoseFree,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.isGlutenFree: false,
          Filter.isVegan: false,
          Filter.isVegetarian: false,
          Filter.isLactoseFree: false,
        });

  void setFilters(Map<Filter, bool> filters) {
    state = {...state, ...filters};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());
