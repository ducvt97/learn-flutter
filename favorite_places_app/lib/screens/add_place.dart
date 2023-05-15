import 'dart:io';

import 'package:favorite_places_app/providers/places.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  late File _selectedImage;

  void addPlace() {
    final title = _titleController.text;
    if (title.isEmpty) return;
    ref.read(userPlacesProvider.notifier).addPlace(title, _selectedImage);
    Navigator.of(context).pop();
  }

  void onSelectImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(label: Text('Title')),
            controller: _titleController,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 16),
          ImageInput(onSelectImage: onSelectImage),
          const SizedBox(height: 16),
          const LocationInput(),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: addPlace,
            icon: const Icon(Icons.add),
            label: const Text('Add place'),
          ),
        ]),
      ),
    );
  }
}
