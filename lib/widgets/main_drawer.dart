import 'package:flutter/material.dart';
import 'package:meals_app/pages/filters_page.dart';
import '../pages/category_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            height: 120,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          buildListTile('Pratos', Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile('Filtros', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FiltersPage.routeName);
          }),
        ],
      ),
    );
  }
}
