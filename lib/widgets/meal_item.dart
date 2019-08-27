import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../pages/meal_detail_page.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal);

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailPage.routeName, arguments: meal);
  }

  String get getComplexity {
    switch (meal.complexity) {
      case Complexity.Challenging:
        return 'Desafiador';
      case Complexity.Hard:
        return 'Difícil';
      case Complexity.Simple:
        return 'Simples';
      default:
        return 'Desconhecido';
    }
  }

  String get getAffordability {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Barato';
      case Affordability.Luxurious:
        return 'Luxo';
      case Affordability.Pricey:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(getComplexity),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(getAffordability),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
