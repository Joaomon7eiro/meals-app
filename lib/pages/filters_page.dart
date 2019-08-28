import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const String routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersPage(this.filters, this.saveFilters);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.filters['isGlutenFree'];
    _isLactoseFree = widget.filters['isLactoseFree'];
    _isVegetarian = widget.filters['isVegetarian'];
    _isVegan = widget.filters['isVegan'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('filtros'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              widget.saveFilters({
                'isGlutenFree': _isGlutenFree,
                'isLactoseFree': _isLactoseFree,
                'isVegetarian': _isVegetarian,
                'isVegan': _isVegan,
              });
            },
            child: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Ajustes',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Sem Glúten'),
                  onChanged: (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                  value: _isGlutenFree,
                  subtitle: Text('Somente comidas sem Glúten'),
                ),
                SwitchListTile(
                  title: Text('Sem Lactose'),
                  onChanged: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                  value: _isLactoseFree,
                  subtitle: Text('Somente comidas sem Lactose'),
                ),
                SwitchListTile(
                  title: Text('Vegetariana'),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                  value: _isVegetarian,
                  subtitle: Text('Somente comidas Vegetariana'),
                ),
                SwitchListTile(
                  title: Text('Veganas'),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                  value: _isVegan,
                  subtitle: Text('Somente comidas Veganas'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
