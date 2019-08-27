import 'package:flutter/material.dart';
import 'package:meals_app/pages/meal_detail_page.dart';

import './pages/category_meals_page.dart';
import './pages/meal_detail_page.dart';
import './pages/filters_page.dart';
import './pages/tabs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/': (ctx) => TabsPage(),
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealDetailPage.routeName: (ctx) => MealDetailPage(),
        FiltersPage.routeName: (ctx) => FiltersPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryMealsPage(),
        );
      },
    );
  }
}
