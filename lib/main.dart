import 'package:flutter/material.dart';

import './pages/favorite_page.dart';
import './pages/meal_detail_page.dart';
import './pages/category_meals_page.dart';
import './pages/filters_page.dart';
import './pages/tabs_page.dart';

import './models/meal.dart';

import './dummy-data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _filteredMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  Map<String, bool> _filter = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegetarian': false,
    'isVegan': false,
  };

  void _saveFilter(Map<String, bool> filters) {
    setState(() {
      _filter = filters;
      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (_filter['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filter['isVegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    if (_favoriteMeals.contains(meal)) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsPage(_favoriteMeals),
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(_filteredMeals),
        MealDetailPage.routeName: (ctx) =>
            MealDetailPage(_isFavorite, _toggleFavorite),
        FiltersPage.routeName: (ctx) => FiltersPage(_filter, _saveFilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryMealsPage(_filteredMeals),
        );
      },
    );
  }
}
