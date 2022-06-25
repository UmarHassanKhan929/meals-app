import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/category_meals_screen.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/filters_screen.dart';
import 'package:flutter_complete_guide/tabs_screen.dart';
import './categories_screen.dart';
import './meal_detail_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriateMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriateMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriateMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriateMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.blueAccent,
        fontFamily: 'Urbanist',
        backgroundColor: Color.fromARGB(255, 255, 239, 193),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline2: const TextStyle(
                fontSize: 24,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
              ),
              headline3: const TextStyle(
                fontSize: 20,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
              ),
              bodyText1: const TextStyle(
                fontSize: 16,
                fontFamily: 'Urbanist',
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabScreen(favouriateMeals: _favouriateMeals),
        '/category-meals': (ctx) => CategoryMealScreen(_availableMeals),
        '/meal-detail': (ctx) => MealDetailScreen(),
        '/filters': (ctx) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}
