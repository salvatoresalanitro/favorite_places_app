import 'dart:io';

import 'package:favorite_places_app/models/place_location.dart';
import 'package:favorite_places_app/providers/user_places.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null || _selectedLocation == null) {
      return;
    }

    ref.read(userPlacesProviders.notifier).addPlace(enteredTitle, _selectedImage!, _selectedLocation!);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
        backgroundColor: Theme.of(context).appBarTheme
            .copyWith(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHigh,
            )
            .backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 10),
              ImageInput(
                onPickImage: (image) => _selectedImage = image,
              ),
              const SizedBox(height: 10),
              LocationInput(
                onSelectLocation: (location) =>
                    _selectedLocation = location,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: Icon(Icons.add),
                label: Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
