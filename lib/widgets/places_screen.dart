import 'package:favorite_places_app/widgets/new_place_item.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  List<NewPlaceitem> _newPlaces = [];

  void _addNewPlace() async {
    final newPlace = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => NewPlaceitem()),
    );

    if(newPlace == null) {
      return;
    }

    setState(() {
      _newPlaces.add(newPlace);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(onPressed: _addNewPlace, icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
