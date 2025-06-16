import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class AddPlace extends StatelessWidget {
  const AddPlace({super.key});

  void _saveItem(
    BuildContext context,
    TextEditingController titleController,
  ) {
    Navigator.pop(context, Place(title: titleController.text));
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();

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
                controller: titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _saveItem(context, titleController),
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
