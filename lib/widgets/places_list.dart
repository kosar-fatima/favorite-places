import 'package:favorite_places/Screens/places_detail.dart';
import 'package:flutter/material.dart';

import '../Models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            places[index].location.address,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return PlaceDetailScreen(
                    place: places[index],
                  );
                },
              ),
            );
          },
        );
      },
      itemCount: places.length,
    );
  }
}
