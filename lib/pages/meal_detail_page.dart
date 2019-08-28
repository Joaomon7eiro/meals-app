import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailPage extends StatelessWidget {
  static const String routeName = '/meal-detail';

  final Function isFavorite;
  final Function toggleFavorite;

  MealDetailPage(this.isFavorite, this.toggleFavorite);

  Widget builderSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget builderContainerList(BuildContext context, ListView listView) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.25,
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              builderSectionTitle(context, 'Ingredientes'),
              builderContainerList(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
              builderSectionTitle(context, 'Passos'),
              builderContainerList(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: meal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(meal) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          toggleFavorite(meal.id);
        },
      ),
    );
  }
}
