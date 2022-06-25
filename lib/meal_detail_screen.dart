import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import './dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  // final Function toggleFavorite;
  // final Function isFavorite;
  // MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  '~ ' + selectedMeal.ingredients.join('\n\n~ '),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                '~ ' + selectedMeal.steps.join('\n\n~ '),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
