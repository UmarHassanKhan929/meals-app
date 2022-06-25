import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(40),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).backgroundColor,
            child: Text(
              'Da Lamb Sauce',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 25,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.headline2,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.filter_alt_rounded,
              size: 25,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.headline2,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          )
        ],
      ),
    );
  }
}
