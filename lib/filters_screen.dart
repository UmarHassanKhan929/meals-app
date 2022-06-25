import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/drawer_page.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.saveFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                });
              },
              icon: Icon(Icons.save))
        ],
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
              child: ListView(children: [
            SwitchListTile(
              activeColor: Theme.of(context).primaryColor,
              title: Text('Gluten-free'),
              subtitle: Text('Only show Gluten-free meals'),
              value: _glutenFree,
              onChanged: (value) {
                setState(() {
                  _glutenFree = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Vegetarian'),
              subtitle: Text('Only show Vegetarian meals'),
              activeColor: Theme.of(context).primaryColor,
              value: _vegetarian,
              onChanged: (value) {
                setState(() {
                  _vegetarian = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Vegan'),
              subtitle: Text('Only show Vegan meals'),
              activeColor: Theme.of(context).primaryColor,
              value: _vegan,
              onChanged: (value) {
                setState(() {
                  _vegan = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Lactose-free'),
              subtitle: Text('Only show Lactose-free meals'),
              activeColor: Theme.of(context).primaryColor,
              value: _lactoseFree,
              onChanged: (value) {
                setState(() {
                  _lactoseFree = value;
                });
              },
            ),
          ])),
        ],
      ),
    );
  }
}
