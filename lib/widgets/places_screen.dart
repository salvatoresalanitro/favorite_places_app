import 'package:favorite_places_app/widgets/new_place_screen.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {

  void _addNewPlace() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => NewPlaceScreen()),
    );
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
