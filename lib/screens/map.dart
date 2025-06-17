import 'package:favorite_places_app/models/place_location.dart';
import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  const Map({
    super.key,
    this.location = const PlaceLocation(
      latitude: 34.422,
      longitude: -122.084,
      address: '',
    ),
  });
  final PlaceLocation location;

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
