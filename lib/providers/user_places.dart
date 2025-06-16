import 'package:favorite_places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(Place newPlace) {
    state = [newPlace, ...state];
  }
}

final userPlacesProviders = StateNotifierProvider(
  (ref) => UserPlacesNotifier(),
);
