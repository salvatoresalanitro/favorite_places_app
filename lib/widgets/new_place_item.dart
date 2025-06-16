import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class NewPlaceitem extends StatelessWidget {
  const NewPlaceitem({super.key});

  void _saveItem(BuildContext context, TextEditingController titleController) {
    Navigator.pop(context, Place(title: titleController.text));
  }


  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(title: Text('Add new Place')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text('Title')),
              controller: titleController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _saveItem(context, titleController),
              child: const SizedBox(
                height: 40,
                width: 78,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,),
                    SizedBox(width: 8),
                    Text('Add Place'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
