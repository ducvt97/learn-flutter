import 'package:flutter/material.dart';
import 'package:meals_app/utils/get_string.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final Affordability affordability;
  final String imgUrl;
  final double duration;
  final Complexity complexity;

  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.affordability,
    required this.imgUrl,
    required this.duration,
    required this.complexity,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal-detail', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    Widget infoItem(String content, Icon icon) {
      return Row(
        children: [
          icon,
          const SizedBox(width: 6),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      );
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => selectMeal(context),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                // clipping corner of image
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imgUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.all(16),
                  color: Colors.black54,
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                infoItem(
                  '${duration.ceil()} mins',
                  const Icon(Icons.access_time),
                ),
                infoItem(
                  GetString.getComplexityString(complexity),
                  const Icon(Icons.work),
                ),
                infoItem(
                  GetString.getAffordabilityString(affordability),
                  const Icon(Icons.attach_money),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
