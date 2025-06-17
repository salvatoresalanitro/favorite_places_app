import 'package:favorite_places_app/providers/user_places.dart';
import 'package:favorite_places_app/screens/add_place.dart';
import 'package:favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Places extends ConsumerStatefulWidget {
  const Places({super.key});

  @override
  ConsumerState<Places> createState() {
    return _PlacesState();
  }
}

class _PlacesState extends ConsumerState<Places> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref
        .read(userPlacesProviders.notifier)
        .loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlacesProviders);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        backgroundColor: Theme.of(context).appBarTheme
            .copyWith(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHigh,
            )
            .backgroundColor,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => AddPlace()),
            ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : PlacesList(places: userPlaces),
        ),
      ),
    );
  }
}
