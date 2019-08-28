import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritePage extends StatelessWidget {
  static const String routeName = "/favorites";
  final List<Meal> meals;
  FavoritePage(this.meals);

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return Center(
        child: Text('Nenhum favorito adicionado ainda'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meals[index]);
        },
        itemCount: meals.length,
      );
    }
  }
}
