import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favouriateMeals;
  FavouritesScreen(this.favouriateMeals, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Looks so empty, like your soul...'),
    );
  }
}
