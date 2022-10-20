import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/views/constant/routes.gr.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final int duration;
  final Complexity complexity;
  const MealItem(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.affordability,
      required this.duration,
      required this.complexity,
      required this.id})
      : super(key: key);
  void selectMeal(BuildContext context) {
    context.router.push(MealDetailsRoute(mealsId: id));
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      case Complexity.simple:
        return 'Simple';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Expensive';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Stack(
            //   children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                height: 250,
                width: double.infinity,
              ),
            ),
            // Positioned(
            //   bottom: 20,
            //   right: 10,
            Container(
              decoration: BoxDecoration(
                  // color: const Color(0XFF8F6BF5),
                  borderRadius: BorderRadius.circular(10)),
              transform: Matrix4.rotationZ(-0.07),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: 300,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: 'Amperzand',
                  overflow: TextOverflow.fade,
                ),
                softWrap: true,
              ),
            ),
            // ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration min')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(complexityText),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
