import 'package:flutter/material.dart';

class NewPlaceitem extends StatelessWidget {
  const NewPlaceitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Place')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text('Title')),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.add,),
                  const SizedBox(width: 12),
                  Text('Add Place'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
