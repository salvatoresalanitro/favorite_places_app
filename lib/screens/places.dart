import 'package:favorite_places_app/models/place.dart';
import 'package:favorite_places_app/screens/add_place.dart';
import 'package:favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  final List<Place> _places = [];

  void _addNewPlace() async {
    final newPlace = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddPlace()),
    );

    if (newPlace == null) {
      return;
    }

    setState(() {
      _places.add(newPlace);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          IconButton(onPressed: _addNewPlace, icon: Icon(Icons.add)),
        ],
      ),
      body: PlacesList(places: _places),
    );
  }
}
