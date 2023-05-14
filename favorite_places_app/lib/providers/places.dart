import 'package:favorite_places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title) {
    final newState = Place(title: title);
    state = [newState, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider((ref) => UserPlacesNotifier());
