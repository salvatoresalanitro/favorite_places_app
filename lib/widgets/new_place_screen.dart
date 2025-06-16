import 'package:flutter/material.dart';

class NewPlaceScreen extends StatelessWidget {
  const NewPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Place')),
      body: Expanded(
        child: Column(
          children: [
            TextField(),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [Icon(Icons.add), Text('Add Place')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
