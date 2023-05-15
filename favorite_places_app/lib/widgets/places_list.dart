import 'package:favorite_places_app/models/place.dart';
import 'package:favorite_places_app/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;
  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return places.isEmpty
        ? Center(
            child: Text(
              'No places added yet.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading:
                  CircleAvatar(foregroundImage: FileImage(places[index].image)),
              title: Text(
                places[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlaceDetail(placeInfo: places[index]),
                ));
              },
            ),
            itemCount: places.length,
          );
  }
}
