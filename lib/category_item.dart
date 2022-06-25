import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/category_meals_screen.dart';
import 'category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({
    @required this.title,
    @required this.color,
    @required this.id,
  });

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color.withOpacity(0.3),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
