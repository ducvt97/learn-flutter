import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  final Place placeInfo;
  const PlaceDetail({super.key, required this.placeInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(placeInfo.title),
      ),
      body: Center(
        child: Text(
          placeInfo.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
